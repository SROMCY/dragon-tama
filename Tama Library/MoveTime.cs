/* Overview
* --------
* 
* SchneebergerLinearTechnology AG
* Andreas Weibel
* 
* MoveTime supports check for settling window and consider minimal settle duration
* 
*/

using Triamec.Tama.Rlid19;
using Triamec.Tama.Vmid5;

public class MoveTime
{
    // sampling time
    const float cTs = 0.0001f;
    // sampling frequency
    const float cFs = 10000.0f;

    // move timer
    int moveTimer;
    // settling timer
    int settlingTimer;
    // settling window
    float settlingWindow;
    // minimal required duration within settling window 
    int minSettleDuration;
    // settled state
    public bool IsSettled { get; private set; }


    public MoveTime(float settlingWindow, float minSettleDuration)
    {
        moveTimer = 0;
        settlingTimer = 0;
        Set(settlingWindow, minSettleDuration);
    }


    /*****************************************************************
    * return move time
    *****************************************************************/
    public float GetMoveTime()
    {
        return moveTimer * cTs;
    }

    /*****************************************************************
    * set parameter
    *****************************************************************/
    public void Set(float settlingWindow, float minSettleDuration)
    {
        this.settlingWindow = settlingWindow;
        this.minSettleDuration = (int)(minSettleDuration*cFs);
    }

    /*****************************************************************
    * execute settling time measurement
    *****************************************************************/
    public void Run(float positionError, bool isMoving)
    {
        // reset timer
        if (IsSettled && isMoving)   // new movement has started
        {
            IsSettled = false;
            moveTimer = 0;
        }
        // update timer
        if (!IsSettled)
        {
            moveTimer++;

            // increment settlingTimer within settlingWindow, also if move is not finished jet!
            if (positionError < settlingWindow && positionError > -settlingWindow)
            {
                settlingTimer++;
                // true if within settling window for minSettleDuration and path planer has also finished move.
                IsSettled = settlingTimer > minSettleDuration && !isMoving;
            }
            else
            {
                settlingTimer = 0;
            }
        }
    }
}