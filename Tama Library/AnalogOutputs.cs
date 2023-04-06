/* Overview
* --------
* 
* Schneeberger Linear Technology AG 2021
* Andreas Weibel
*
* Supports anlog output option module with gain and offset scaling
* 
*/


using Triamec.Tama.Rlid19;


public class AnalogOutputs
{
    // axis index
    private readonly int axisIdx;
    // gain parameter
    private float[] gain;
    // offset parameter
    private float[] offset;
    // array of commanded intput
    private float[] input;

    public AnalogOutputs(int axisIndex)
    {
        axisIdx = axisIndex;
        gain = new float[4];
        offset = new float[4];
        input = new float[4];
    }

    public void SetGain(float gainA, float gainB, float gainC, float gainD)
    {
        gain[0] = gainA;
        gain[1] = gainB;
        gain[2] = gainC;
        gain[3] = gainD;
    }

    public void SetOffset(float offsetA, float offsetB, float offsetC, float offsetD)
    {
        offset[0] = offsetA;
        offset[1] = offsetB;
        offset[2] = offsetC;
        offset[3] = offsetD;
    }

    public void SetAnalogOutputs(float A, float B, float C, float D)
    {
        input[0] = A;
        input[1] = B;
        input[2] = C;
        input[3] = D;

        for (int ii = 0; ii < input.Length; ii++)
        {
            float output = input[ii] * gain[ii] + offset[ii];

            switch (axisIdx)
            {
                case 0:
                    Register.Axes_0.Commands.OptionModule.AnalogOut[ii] = output;
                    break;
                case 1:
                    Register.Axes_1.Commands.OptionModule.AnalogOut[ii] = output;
                    break;
            }
        }
    }
}