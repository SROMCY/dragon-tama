/* Overview
* --------
* 
* Triamec Motion AG 2021
* Damian Gisler
*
* Implementation of one and two dimensional axis compensation with
* linerar interpolation.
* 
* TODO: 
* * change transition ramp to cosinus function
*/


using Triamec.Tama.Rlid19;
using Triamec.Tama.Vmid5;


public class AxisCompensation
{
    /*****************************************************************
    * types
    *****************************************************************/
    private enum State
    {
        WaitHomingDone = 0,
        RampUp = 1,
        CompensationActive = 2,
    }

    /*****************************************************************
    * constants
    *****************************************************************/
    // sampling frequency
    public const float cFs = 10000.0f; // [Hz]
    // sampling time
    public const float cTs = 1.0f / cFs; // [s]
    // duration to ramp up the compensation
    const float cRampTime = 0.2f; //s
    // gain increment to apply the ramp
    const float compGainInc = cTs / cRampTime;


    /*****************************************************************
    * members
    *****************************************************************/
    // main state
    State state;
    // gain used to apply a ramp when compensation is applied
    float compGain;
    // index of TAM table to use
    int tblIdx;

    /*****************************************************************
    * constructor
    *****************************************************************/
    public AxisCompensation(int tableIndex)
    {
        // init members
        compGain = 0.0f;
        state = State.WaitHomingDone;
        tblIdx = tableIndex;
    }

    /*****************************************************************
    * evaluates lower index for interpolation with range check
    *****************************************************************/
    static void GetIndexAndOffset(float posAbs, float startValue, float distance, int tblSize, out int index, out float offset)
    {
        // consider position offset
        float posRel = posAbs - startValue;

        // express position as node index
        float idxFloat = posRel / distance;

        // index of lower node
        index = (int)Math.Floor(idxFloat);

        // check for out of range x
        if (index < 0)
        {
            index = 0;
            offset = 0.0f;
        }
        else if (index >= tblSize - 1)
        {
            index = tblSize - 2;
            offset = 1.0f;
        }
        else
        {
            offset = idxFloat - index;
        }
    }

    /*****************************************************************
    * 1D interpolation at encoder position xEnc
    *****************************************************************/
    public float GetCompensation1D(float xEnc)
    {
        // table parameters x
        float startValueX;
        float distanceX;
        int tblSizeX;
        switch (tblIdx)
        {
            case 1:
                startValueX = Register.Application.Tables.Small1.Header.Dim1.StartValue;
                distanceX = Register.Application.Tables.Small1.Header.Dim1.Distance;
                tblSizeX = Register.Application.Tables.Small1.Header.Dim1.Size;
                break;
            case 2:
                startValueX = Register.Application.Tables.Small2.Header.Dim1.StartValue;
                distanceX = Register.Application.Tables.Small2.Header.Dim1.Distance;
                tblSizeX = Register.Application.Tables.Small2.Header.Dim1.Size;
                break;
            default:
                return 0;
        }

        // avoid division by zero
        if (distanceX <= 0)
        {
            return 0;
        }

        GetIndexAndOffset(xEnc, startValueX, distanceX, tblSizeX, out int idx, out float offset);

        float c0;
        float c1;
        switch (tblIdx)
        {
            case 1:
                c0 = Register.Application.Tables.Small1.Data.Float[idx];
                c1 = Register.Application.Tables.Small1.Data.Float[idx + 1];
                break;
            case 2:
                c0 = Register.Application.Tables.Small2.Data.Float[idx];
                c1 = Register.Application.Tables.Small2.Data.Float[idx + 1];
                break;
            default:
                return 0;
        }

        // linear interpolation
        /*
                    +---------+----------+
                 c0(nx)       |        c1(nx+1)
                            xEnc 
        */
        return c0 + offset * (c1 - c0);
    }

    /*****************************************************************
    * 2D interpolation at encoder position xEnc
    *****************************************************************/
    public float GetCompensation2D(float xEnc, float yEnc)
    {

        float startValueX;
        float distanceX;
        int tblSizeX;
        float startValueY;
        float distanceY;
        int tblSizeY;
        switch (tblIdx)
        {
            case 1:
                // table parameters x
                startValueX = Register.Application.Tables.Small1.Header.Dim1.StartValue;
                distanceX = Register.Application.Tables.Small1.Header.Dim1.Distance;
                tblSizeX = Register.Application.Tables.Small1.Header.Dim1.Size;

                // table parameters y
                startValueY = Register.Application.Tables.Small1.Header.Dim2.StartValue;
                distanceY = Register.Application.Tables.Small1.Header.Dim2.Distance;
                tblSizeY = Register.Application.Tables.Small1.Header.Dim2.Size;
                break;
            case 2:
                // table parameters x
                startValueX = Register.Application.Tables.Small2.Header.Dim1.StartValue;
                distanceX = Register.Application.Tables.Small2.Header.Dim1.Distance;
                tblSizeX = Register.Application.Tables.Small2.Header.Dim1.Size;

                // table parameters y
                startValueY = Register.Application.Tables.Small2.Header.Dim2.StartValue;
                distanceY = Register.Application.Tables.Small2.Header.Dim2.Distance;
                tblSizeY = Register.Application.Tables.Small2.Header.Dim2.Size;
                break;
            default:
                return 0;
        }

        // avoid division by zero
        if (distanceX <= 0 || distanceY <= 0)
        {
            return 0;
        }

        GetIndexAndOffset(xEnc, startValueX, distanceX, tblSizeX, out int idxX, out float offsetX);
        GetIndexAndOffset(yEnc, startValueY, distanceY, tblSizeY, out int idxY, out float offsetY);

        // return compensation value
        int idx = idxX * tblSizeY + idxY;
        float c00;
        float c01;
        float c10;
        float c11;
        switch (tblIdx)
        {
            case 1:
                c00 = Register.Application.Tables.Small1.Data.Float[idx];
                c01 = Register.Application.Tables.Small1.Data.Float[idx + 1];
                c10 = Register.Application.Tables.Small1.Data.Float[idx + tblSizeY];
                c11 = Register.Application.Tables.Small1.Data.Float[idx + tblSizeY + 1];
                break;
            case 2:
                c00 = Register.Application.Tables.Small2.Data.Float[idx];
                c01 = Register.Application.Tables.Small2.Data.Float[idx + 1];
                c10 = Register.Application.Tables.Small2.Data.Float[idx + tblSizeY];
                c11 = Register.Application.Tables.Small2.Data.Float[idx + tblSizeY + 1];
                break;
            default:
                return 0;
        }


        // bilinear interpolation
        /*
               c01(nx,ny+1)        c11(nx+1,ny+1)
                    +---------+----------+
                              |  
                              |  
                              +--yEnc
                              |  
                    +---------+----------+
                c00(nx,ny)    |     c10(nx+1,ny)
                            xEnc 
        */
        float x0 = c00 + offsetX * (c10 - c00);
        float x1 = c01 + offsetX * (c11 - c01);
        return x0 + offsetY * (x1 - x0);
    }


    /*****************************************************************
    * 2D interpolation at encoder position xEnc
    *****************************************************************/
    float StateMachine(bool enable)
    {
        // main state machine
        switch (state)
        {
            case State.WaitHomingDone:
                // compensation is not applied until homing is done
                if (enable && compGain == 0.0f)
                {
                    state = State.RampUp;
                }
                // decrement gain to zero
                compGain = (compGain < compGainInc) ? 0.0f : compGain - compGainInc;
                break;

            case State.RampUp:
                // check if HomingDone is reset
                if (enable)
                {
                    // increment gain
                    compGain += compGainInc;
                    if (compGain >= 1.0f)
                    {
                        compGain = 1.0f;
                        state = State.CompensationActive;
                    }
                }
                else // HomingDone is reset
                {
                    state = State.WaitHomingDone;
                }
                break;

            case State.CompensationActive:
                // check if HomingDone is reset
                if (!enable)
                {
                    state = State.WaitHomingDone;
                }
                break;

            default:
                state = State.WaitHomingDone;
                break;
        }
        return compGain;
    }

    /*****************************************************************
    * main implementation
    *****************************************************************/
    public float Run1D(bool enable, float xEnc)
    {
        // call to state machine 
        float gain = StateMachine(enable);

        // eval compensation


        return GetCompensation1D(xEnc) * gain;
    }

    /*****************************************************************
     * main implementation
     *****************************************************************/
    public float Run2D(bool enable, float xEnc, float yEnc)
    {
        // call to state machine 
        float gain = StateMachine(enable);

        // apply compensation
        return GetCompensation2D(xEnc, yEnc) * gain;
    }
}