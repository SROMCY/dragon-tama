/* Overview
* --------
* 
* SchneebergerLinearTechnology AG
* Andreas Weibel
*
* XGantry
* 
*/


using System.Collections.Specialized;
using Triamec.Tama.Rlid19;
using Triamec.Tama.Vmid5;


[Tama]
public class XGantry
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

    // table index for compensation of axis 0
    const int axis0TblIdx = 1;
    // create axis compensation for axis 0
    static AxisCompensation axis0Compensation;

    #endregion
    #region YawEncoderMapping
    static GantryEncoderAlignment encoderAlignment = new GantryEncoderAlignment();
    #endregion


    static XGantry()
    {
        settlingTimeA0 = new MoveTime(
            Register.Application.Parameters.Floats[0],    // settling window in user unit
            Register.Application.Parameters.Floats[1]     // minimal settling time in seconds
            );
        settlingTimeA1 = new MoveTime(
            Register.Application.Parameters.Floats[2],    // settling window in user unit
            Register.Application.Parameters.Floats[3]     // minimal settling time in seconds
            );

        axis0Compensation = new AxisCompensation(axis0TblIdx);

        Register.Application.TamaControl.IsochronousMainCommand = 4; // apply yaw encoder mapping at startup
    }

    [TamaTask(Task.IsochronousMain)]
    static void IsochronousTask()
    {
        //***********************************************************
        // check for hardware error
        //***********************************************************
        Register.Application.Variables.Booleans[10] = (Register.Axes_0.Signals.General.DigitalInputBits & (1 << 0)) == 0; // input bit 0, status of power supply
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
        // 2D compensation
        //***********************************************************
        // set the position source
        float xEnc = Register.Axes_0.Signals.PathPlanner.PositionFloat;
        float yEnc = (float)Register.Axes_1.Commands.PathPlanner.StreamX;

        // apply the compensation to Axis[0]
        bool enable = Register.Axes_0.Signals.Homing.State == HomingState.HomingDone &&
            Register.Axes_0.Signals.General.AxisState >= Triamec.TriaLink.AxisState.Standstill;
        float axisCompensationValue = axis0Compensation.Run2D(enable, xEnc, yEnc);

        #endregion
        #region YawEncoderMapping
        //***********************************************************
        // gantry encoder aligment
        //***********************************************************

        GantryEncoderAlignment.Command command = (GantryEncoderAlignment.Command)Register.Application.TamaControl.IsochronousMainCommand;
        Register.Application.TamaControl.IsochronousMainCommand = (int)encoderAlignment.Run(command);

        float alignmentCorrectionValue = encoderAlignment.GetCorrection();
        #endregion

        //***********************************************************
        // apply 2D axis compensation and encoder alignment
        //***********************************************************
        Register.Axes_0.Commands.PositionController.Encoders_0.InjectedPosition = axisCompensationValue + alignmentCorrectionValue;
        Register.Axes_1.Commands.PositionController.Encoders_0.InjectedPosition = axisCompensationValue - alignmentCorrectionValue;
    }
}