/* Overview
* --------
* 
* SchneebergerLinearTechnology AG
* Andreas Weibel
*
* ZDualloop
* 
*/


using Triamec.Tama.Rlid19;
using Triamec.Tama.Vmid5;


[Tama]
public class ZDualloop
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
    static readonly MoveTime settlingTimeA0;

    #endregion

    #region AccuracyMapping
    // create axis compensation for axis 0
    static readonly AxisCompensation axis0Compensation;
    #endregion

    static ZDualloop()
    {
        settlingTimeA0 = new MoveTime(
            Register.Application.Parameters.Floats[0],    // settling window in user unit
            Register.Application.Parameters.Floats[1]     // minimal settling time in seconds
            );

        axis0Compensation = new AxisCompensation(1);      // table index for compensation of axis 0
    }


    [TamaTask(Task.IsochronousMain)]
    static void IsochronousTask()
    {
        //***********************************************************
        // check for hardware error
        //***********************************************************
        //Register.General.Commands.ExternalError = Register.Application.Variables.Booleans[10] || Register.Application.Variables.Booleans[11] || Register.Application.Variables.Booleans[12];


        #region MoveTime
        // set parameters
        settlingTimeA0.Set(Register.Application.Parameters.Floats[0],
            Register.Application.Parameters.Floats[1]);

        // execute  
        settlingTimeA0.Run(
           Register.Axes_0.Signals.PositionController.Controllers_1.PositionError,
           !Register.Axes_0.Signals.PathPlanner.Done);

        // read result
        Register.Application.Variables.Floats[0] = settlingTimeA0.GetMoveTime();
        Register.Application.Variables.Booleans[0] = settlingTimeA0.IsSettled;
        #endregion

        #region AccuracyMapping
        //***********************************************************
        // 1D compensation
        //***********************************************************
        // set the position source
        float linEnc = Register.Axes_0.Signals.PathPlanner.PositionFloat;

        // apply the compensation to Axis[0]
        bool enable = Register.Axes_0.Signals.Homing.State == HomingState.HomingDone &&
            Register.Axes_0.Signals.General.AxisState >= Triamec.TriaLink.AxisState.Standstill;
        float compensation = axis0Compensation.Run1D(enable, linEnc);
        Register.Axes_0.Commands.PositionController.Encoders_1.InjectedPosition = compensation;
        #endregion
    }
}