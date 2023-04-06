/* Overview
* --------
* 
* SchneebergerLinearTechnology AG
* Andreas Weibel
*
* YTheta
* 
*/


using Triamec.Tama.Rlid19;
using Triamec.Tama.Vmid5;


[Tama]
public class YTheta
{
    #region MoveTime
    /*****************************************************************
    *
    * In:
    * Parameters.Floats[0]:     Settling window for axis 0
    * Parameters.Floats[1]:     Minimal settling time for axis 0
    * 
    * Parameters.Floats[2]:     Settling window for axis 1
    * Parameters.Floats[3]:     Minimal settling time for axis 1
    * 
    * Out:
    * Variables.Floats[0]:      Settling time for axis 0
    * Variables.Booleans[0]:    Indicates if settled for axis 0
    * Variables.Floats[1]:      Settling time for axis 1
    * Variables.Booleans[1]:    Indicates if settled for axis 1
    * 
    *****************************************************************/


    // settling time instance
    static MoveTime settlingTimeA0;
    static MoveTime settlingTimeA1;


    #endregion

    #region AccuracyMapping
    // create axis compensation for axis 0
    static readonly AxisCompensation axis0Compensation;
    // create axis compensation for axis 1
    static readonly AxisCompensation axis1Compensation;
    #endregion

    static readonly AnalogOutputs feedforward;

    static YTheta()
    {
        settlingTimeA0 = new MoveTime(
            Register.Application.Parameters.Floats[0],    // settling window in user unit
            Register.Application.Parameters.Floats[1]     // minimal settling time in seconds
            );
        settlingTimeA1 = new MoveTime(
            Register.Application.Parameters.Floats[2],    // settling window in user unit
            Register.Application.Parameters.Floats[3]     // minimal settling time in seconds
            );

        axis0Compensation = new AxisCompensation(1);      // table index for compensation of axis 0
        axis1Compensation = new AxisCompensation(2);      // table index for compensation of axis 1

        // set output range of option module
        for (int ii = 0; ii < Register.Axes_1.Parameters.OptionModule.AO_Range.Length; ++ii)
        {
            Register.Axes_1.Parameters.OptionModule.AO_Range[ii] = OptionToa3Range.Bipolar10V;
        }
        Register.General.Commands.CommitParameter = true;

        // Channel A = X-Acceleration | Channel B = Y-Acceleration | Channel C = X-Position | Channel D = Y-Position
        // used range +/- 10V -> max Pos = 10V / min Pos = -10V
        feedforward = new AnalogOutputs(1);
        feedforward.SetGain(0.0006666666666666f, 0.0006666666666666f, 0.044444446f, 0.05000000f);
        feedforward.SetOffset(0f, 0f, 0.4444442f, -0.5000f);
    }


    [TamaTask(Task.IsochronousMain)]
    static void IsochronousTask()
    {
        //***********************************************************
        // check for hardware error
        //***********************************************************
        Register.Application.Variables.Booleans[11] = (Register.Axes_1.Signals.General.DigitalInputBits & (1 << 0)) == 0; // input bit 0, ready signal of damping system
        Register.Application.Variables.Booleans[12] = (Register.Axes_1.Signals.General.DigitalInputBits & (1 << 1)) == 1; // input bit 1, error signal of damping system
        //Register.General.Commands.ExternalError = Register.Application.Variables.Booleans[10] || Register.Application.Variables.Booleans[11] || Register.Application.Variables.Booleans[12];

        #region MoveTime
        // set parameters
        settlingTimeA0.Set(Register.Application.Parameters.Floats[0],
            Register.Application.Parameters.Floats[1]);
        settlingTimeA1.Set(Register.Application.Parameters.Floats[2],
            Register.Application.Parameters.Floats[3]);

        // execute  
        settlingTimeA0.Run(
            Register.Axes_0.Signals.PositionController.Controllers_0.PositionError,
            !Register.Axes_0.Signals.PathPlanner.Done);
        settlingTimeA1.Run(
            Register.Axes_1.Signals.PositionController.Controllers_0.PositionError,
            !Register.Axes_1.Signals.PathPlanner.Done);

        // read result
        Register.Application.Variables.Floats[0] = settlingTimeA0.GetMoveTime();
        Register.Application.Variables.Booleans[0] = settlingTimeA0.IsSettled;
        Register.Application.Variables.Floats[1] = settlingTimeA1.GetMoveTime();
        Register.Application.Variables.Booleans[1] = settlingTimeA1.IsSettled;
        #endregion

        #region AccuracyMapping
        //***********************************************************
        // 1D compensation
        //***********************************************************
        // set the position source
        float tEnc = Register.Axes_1.Signals.PathPlanner.PositionFloat;

        // apply the compensation to Axis[1]
        bool enableTMap = Register.Axes_1.Signals.Homing.State == HomingState.HomingDone &&
            Register.Axes_1.Signals.General.AxisState >= Triamec.TriaLink.AxisState.Standstill;
        float compTheta = axis1Compensation.Run1D(enableTMap, tEnc);
        Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition = compTheta;

        //***********************************************************
        // 2D compensation
        //***********************************************************
        // set the position source
        float xEnc = (float)Register.Application.Variables.Doubles[5];
        float yEnc = Register.Axes_0.Signals.PathPlanner.PositionFloat;

        // apply the compensation to Axis[0]
        bool enableYMap = Register.Axes_0.Signals.Homing.State == HomingState.HomingDone &&
            Register.Axes_0.Signals.General.AxisState >= Triamec.TriaLink.AxisState.Standstill &&
            (HomingState)Register.Application.Variables.Integers[5] == HomingState.HomingDone;
        float compY = axis0Compensation.Run2D(enableYMap, xEnc, yEnc);
        Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition = compY;
        #endregion

        #region Analog Feedforward
        //***********************************************************
        // Analog FeedForward for IDE Damping System
        //***********************************************************
        float xAcc = Register.Application.Variables.Floats[5];
        float yAcc = Register.Axes_0.Signals.PathPlanner.Acceleration;
        float xPos = (HomingState)Register.Application.Variables.Integers[5] == HomingState.HomingDone ? (float)Register.Application.Variables.Doubles[5] : 0;
        float yPos = Register.Axes_0.Signals.Homing.State == HomingState.HomingDone ? (float)Register.Axes_0.Signals.PathPlanner.Position : 0;

        feedforward.SetAnalogOutputs(xAcc, yAcc, xPos, yPos); // Max: XAcc = 15000mm/s2 | YAcc = 15000mm/s2 | XTravel: 450mm | YTravel: 410mm 
        #endregion
    }
}