/*****************************************************************
* Gantry Encoder Compensation
*****************************************************************
* 
* 
* Triamec Motion AG 2021
* Damian Gisler
* 
* TODO:
* - 
* 
*/

using Triamec.Tama.Rlid19;
using Triamec.Tama.Vmid5;
using Triamec.TriaLink;


public class GantryEncoderAlignment
{
    /*****************************************************************
    * constants
    *****************************************************************/
    // number of nodes
    public const int cNumberOfNodes = 10000;
    // sampling frequency
    public const float cFs = 10000.0f; // [Hz]
    // sampling time
    public const float cTs = 1.0f / cFs; // [s]
    // duration for initial ramp up and down of the compensation
    const float cRampTime = 0.1f; // [s]
    // 1/(2*pi)
    const float invTwoPi = 1.0f / (2 * Math.PI);
    // duration for one scan move
    const float cScanDuration = 30; // [s]
    // gain increment to apply the ramp
    const float compGainInc = cTs / cRampTime;
    // bcause average of up down and both encoders are compensated -> 0.5*0.5=0.25
    const float correctionGain = 0.25f;

    /*****************************************************************
    * type definitions
    *****************************************************************/
    // commands
    public enum Command
    {
        NoAlignment = 0,
        HomeScanApply = 1,
        HomeApply = 2, // requires valid scan
        ScanApply = 3, // requires homing done
        Apply = 4, // requires homing done and valid scan
    }

    // states of main state machine
    private enum MainState
    {
        Idle = 0,           // defined value to allow use of axis module in TamSE
        Home = 1,
        Scan = 2,
        Apply = 3,
    }

    // states of scan state machine 
    private enum ScanState
    {
        Init = 0,
        MoveToStart,
        ScanUp,
        ScanDown,
        MoveToInitPos,
    }

    // states of applicatoin state machine
    private enum ApplyState
    {
        Init = 0,
        RampUp = 1,
        CompensationActive = 2,
    }

    /*****************************************************************
    * members
    *****************************************************************/
    // main state
    MainState mainState;
    // scan state
    ScanState scanState;
    // apply state
    ApplyState applyState;
    // flag to indicate successful scan and valid table
    public bool scanSucceeded;

    // velocity used for the scan
    float scanVelocity;
    // current setpoint index
    public int scanIdx;

    // gain used to apply a ramp when compensation is applied
    float compGain;

    // encoder correction value 
    float alignmentCorrection;


    // test variables
    public int idxTest;
    // current sum
    public float curSum;
    // sum counter
    public float cntSum;

    // initial position
    float initialPosition;
    // scan starts at this position
    float scanStartPosition;
    // scan ends at this position
    float scanEndPosition;
    // distance between nodes
    public float nodeSpacing;
    // modulo counter
    public int moduloCnt;
    // initial offset
    public float initialOffset;

    /*****************************************************************
    * constructor
    *****************************************************************/
    public GantryEncoderAlignment()
    {
        mainState = MainState.Idle;
    }

    /*****************************************************************
    * returns average compensation value at node with index nodeIdx
    *****************************************************************/
    public float GetCompAtNode(int nodeIdx)
    {
        // check for out of range and calc modulo
        nodeIdx = nodeIdx < 0 ? 0 : nodeIdx;
        nodeIdx = nodeIdx >= cNumberOfNodes ? cNumberOfNodes - 1 : nodeIdx;

        return Register.Application.Tables.Small2.Data.Float[nodeIdx];
    }

    /*****************************************************************
    * set compensation value at nodeIdx
    *****************************************************************/
    public void SetCompAtNode(int nodeIdx, float comp, bool cumulate = false)
    {
        nodeIdx = nodeIdx < 0 ? 0 : nodeIdx;
        nodeIdx = nodeIdx >= cNumberOfNodes ? cNumberOfNodes - 1 : nodeIdx;

        if (cumulate)
        {
            comp += Register.Application.Tables.Small2.Data.Float[nodeIdx];
        }
        Register.Application.Tables.Small2.Data.Float[nodeIdx] = comp;
    }

    /*****************************************************************
    * interpolation at encoder position xEnc
    *****************************************************************/
    public float GetComp(float xNorm)
    {
        // express position as node index - avoid division by zero
        float nx = xNorm * cNumberOfNodes;
        // index of lower node
        int n = (int)Math.Floor(nx);
        // compensation value for n
        float cn;
        float dcn;
        cn = GetCompAtNode(n);
        // difference c(n+1)-c(n)
        dcn = GetCompAtNode(n + 1) - cn;
        // interpolation
        return cn + (nx - n) * dcn;
    }

    /*****************************************************************
    * implementation of scan algorithm
    *****************************************************************/
    public bool Scan()
    {
        float scanPosition = Register.Axes_0.Signals.PathPlanner.PositionFloat - scanStartPosition;
        // main state machine 
        switch (scanState)
        {
            case ScanState.Init:
                {
                    // calculate node spacing and number of turns for scan
                    scanSucceeded = false;
                    initialPosition = Register.Axes_0.Signals.PathPlanner.PositionFloat;
                    nodeSpacing = (scanEndPosition - scanStartPosition) / (cNumberOfNodes - 1);
                    // prepare move
                    Register.Axes_0.Commands.PathPlanner.Xnew = scanStartPosition;
                    Register.Axes_0.Commands.PathPlanner.Vnew = scanVelocity;
                    Register.Axes_0.Commands.PathPlanner.Command = PathPlannerCommand.MoveAbsolute_Vel;
                    Register.Axes_0.Commands.CurrentController.InjectedIq = 0.0f;
                    initialOffset = (float)(Register.Axes_1.Signals.PositionController.Encoders_0.Position
                     - Register.Axes_0.Signals.PositionController.Encoders_0.Position);
                    scanState = ScanState.MoveToStart;
                }
                break;

            case ScanState.MoveToStart:
                if (Register.Axes_0.Signals.PathPlanner.Done)
                {
                    Register.Axes_0.Commands.PathPlanner.Xnew = scanEndPosition;
                    Register.Axes_0.Commands.PathPlanner.Vnew = scanVelocity;
                    Register.Axes_0.Commands.PathPlanner.Command = PathPlannerCommand.MoveAbsolute_Vel;
                    scanIdx = 0;
                    curSum = 0;
                    cntSum = 0;
                    scanState = ScanState.ScanUp;
                }
                break;

            case ScanState.ScanUp:
                curSum += (float)(Register.Axes_1.Signals.PositionController.Encoders_0.Position
                    - Register.Axes_0.Signals.PositionController.Encoders_0.Position - initialOffset);
                cntSum++;
                if (((scanIdx + 0.5f) * nodeSpacing) <= scanPosition || Register.Axes_0.Signals.PathPlanner.Done)
                {
                    // update compensation values
                    SetCompAtNode(scanIdx, correctionGain * curSum / cntSum);
                    curSum = 0;
                    cntSum = 0;
                    // check if up scan is done
                    if (++scanIdx >= cNumberOfNodes && Register.Axes_0.Signals.PathPlanner.Done)
                    {
                        scanIdx = cNumberOfNodes - 1;
                        Register.Axes_0.Commands.PathPlanner.Xnew = scanStartPosition;
                        Register.Axes_0.Commands.PathPlanner.Vnew = scanVelocity;
                        Register.Axes_0.Commands.PathPlanner.Command = PathPlannerCommand.MoveAbsolute_Vel;
                        curSum = 0;
                        cntSum = 0;
                        scanState = ScanState.ScanDown;
                    }
                    else if (Register.Axes_0.Signals.PathPlanner.Done) // scan failed
                    {
                        scanSucceeded = false;
                        scanState = ScanState.Init;
                    }
                }
                break;

            case ScanState.ScanDown:
                curSum += (float)(Register.Axes_1.Signals.PositionController.Encoders_0.Position
                    - Register.Axes_0.Signals.PositionController.Encoders_0.Position - initialOffset);
                cntSum += 1;
                if (((scanIdx - 0.5f) * nodeSpacing) >= scanPosition || Register.Axes_0.Signals.PathPlanner.Done)
                {
                    // update compensation values
                    SetCompAtNode(scanIdx, correctionGain * curSum / cntSum, true);
                    curSum = 0;
                    cntSum = 0;
                    // check if scan down is done
                    if (--scanIdx < 0 && Register.Axes_0.Signals.PathPlanner.Done)
                    {
                        scanIdx = 0;
                        Register.Axes_0.Commands.PathPlanner.Xnew = initialPosition;
                        Register.Axes_0.Commands.PathPlanner.Vnew = scanVelocity;
                        Register.Axes_0.Commands.PathPlanner.Command = PathPlannerCommand.MoveAbsolute_Vel;
                        scanSucceeded = true;
                        scanState = ScanState.MoveToInitPos;
                    }
                    else if (Register.Axes_0.Signals.PathPlanner.Done)// scan failed
                    {
                        scanSucceeded = false;
                        scanState = ScanState.Init;
                    }
                }
                break;
            case ScanState.MoveToInitPos:
                if (Register.Axes_0.Signals.PathPlanner.Done)
                {
                    scanState = ScanState.Init;
                }
                break;
        }
        return scanState == ScanState.Init;
    }

    /*****************************************************************
    * apply compensation
    *****************************************************************/
    public bool Apply(bool run)
    {
        // main state machine 
        switch (applyState)
        {
            case ApplyState.Init:
                if (run)
                {
                    applyState = ApplyState.RampUp;
                }
                // decrement gain to zero
                compGain = (compGain < compGainInc) ? 0.0f : compGain - compGainInc;
                break;

            case ApplyState.RampUp:
                if (run)
                {
                    // increment gain
                    compGain += compGainInc;
                    if (compGain >= 1.0f)
                    {
                        compGain = 1.0f;
                        Register.Axes_1.Commands.PositionController.Active = true;
                        applyState = ApplyState.CompensationActive;
                    }
                }
                else
                {
                    Register.Axes_1.Commands.PositionController.Active = false;
                    applyState = ApplyState.Init;
                }
                break;

            case ApplyState.CompensationActive:
                if (!run)
                {
                    // Register.Axes_1.Commands.PositionController.Active = false;
                    applyState = ApplyState.Init;
                }
                break;

            default:
                Register.Axes_1.Commands.PositionController.Active = false;
                applyState = ApplyState.Init;
                break;
        }

        // apply compensation
        float xNorm = (Register.Axes_0.Signals.PathPlanner.PositionFloat - scanStartPosition)
                    / (nodeSpacing * (cNumberOfNodes - 1));

        alignmentCorrection = GetComp(xNorm) * compGain;

        return applyState == ApplyState.Init && compGain <= 0;
    }

    /*****************************************************************
    * returns correction value
    *****************************************************************/
    public float GetCorrection()
    {
        // alignment correction is only valid if mainState = Apply
        if (mainState != MainState.Apply)
        {
            alignmentCorrection = 0.0f;
        }
        return alignmentCorrection;
    }

    /*****************************************************************
    * implementation of compensation
    *****************************************************************/
    public Command Run(Command command)
    {
        // enable rotaional controller in case axis was disabled
        if(Register.Axes_0.Signals.General.AxisState < AxisState.Standstill)
        {
            Register.Axes_1.Commands.PositionController.Active = true;
        }

        switch (mainState)
        {
            case MainState.Idle:
                // rotational controller must not be enabled until homing is done
                if (Register.Axes_0.Signals.General.AxisState >= AxisState.Standstill
                    && Register.Axes_0.Signals.Homing.State != HomingState.HomingDone)
                {
                    Register.Axes_1.Commands.PositionController.Active = false;
                }

                switch (command)
                {
                    case Command.HomeScanApply:
                    case Command.HomeApply:
                        Register.Axes_1.Commands.PositionController.Active = false; // disable yaw axis
                        Register.Axes_0.Commands.Homing.Command = HomingCommand.Start;
                        mainState = MainState.Home;
                        break;
                    case Command.ScanApply:
                        if (Register.Axes_0.Signals.Homing.State == HomingState.HomingDone)
                        {
                            // initialize
                            Register.Axes_1.Commands.PositionController.Active = false; // disable yaw axis
                            float limitDistance = 0.1f;
                            scanStartPosition = Register.Axes_0.Parameters.PathPlanner.PositionMinimum + limitDistance;
                            scanEndPosition = Register.Axes_0.Parameters.PathPlanner.PositionMaximum - limitDistance;
                            scanVelocity = (scanEndPosition - scanStartPosition) / cScanDuration;
                            mainState = MainState.Scan;
                        }
                        else
                        {
                            command = Command.NoAlignment;
                        }
                        break;
                    case Command.Apply:
                        if (Register.Axes_0.Signals.Homing.State == HomingState.HomingDone &&
                           Register.Application.Parameters.Booleans[7]) // table is valid
                        {
                            // initialize
                            scanStartPosition = Register.Application.Tables.Small2.Header.Dim1.StartValue;
                            nodeSpacing = Register.Application.Tables.Small2.Header.Dim1.Distance;
                            mainState = MainState.Apply;
                        }
                        else
                        {
                            command = Command.NoAlignment;
                        }
                        break;
                }
                break;

            case MainState.Home:
                if (Register.Axes_0.Signals.Homing.State == HomingState.HomingDone)
                {
                    // set rotational position to zero to prepare for balance gain adaption
                    Register.Axes_1.Commands.PathPlanner.Xnew = 0.0f;
                    Register.Axes_1.Commands.PathPlanner.Command = PathPlannerCommand.SetPosition;

                    // apply next command
                    if (command == Command.HomeScanApply)
                    {
                        command = Command.ScanApply;
                    }
                    if (command == Command.HomeApply)
                    {
                        command = Command.Apply;
                    }
                    mainState = MainState.Idle;
                }
                else if (command == Command.NoAlignment)
                {
                    mainState = MainState.Idle;
                }
                break;
            case MainState.Scan:
                if (Scan())
                {
                    Register.Application.Parameters.Booleans[7] = scanSucceeded;
                    if (scanSucceeded)
                    {
                        Register.Application.Tables.Small2.Header.Dim1.StartValue = scanStartPosition;
                        Register.Application.Tables.Small2.Header.Dim1.Distance = nodeSpacing;
                        Register.Application.Tables.Small2.Header.Dim1.Size = cNumberOfNodes;
                        Register.Application.Tables.Small2.Header.RowSize = 1;
                        Register.Application.Tables.Small2.Header.Persistent = true;
                        Register.Application.Tables.Small2.Command = TableCommand.Commit;
                    }
                    command = Command.Apply;
                    mainState = MainState.Idle;
                }
                break;
            case MainState.Apply:
                if (Apply(command == Command.Apply &&
                    Register.Axes_0.Signals.Homing.State == HomingState.HomingDone))
                {
                    command = Command.NoAlignment;
                    mainState = MainState.Idle;
                }
                break;
        }
        return command;
    }
}
