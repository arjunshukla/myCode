public class ConcretePlayer implements Observer {

    protected int playerCurrentPositionID;
    protected int playerPreviousPositionID;
    protected Days day;
    protected int[]dayTracker=new int[11];
    protected int numberOfEODs=0;
    protected int playerBurnedHours=0;
    //     protected int numberOnDice;
    protected int[] dice;
    protected int numberOfDiceEarned;
    
    protected boolean isPlayerTurn;
    //     protected boolean firstTurn;
    protected boolean isFirstTurn=true;
    protected boolean isPlayerImpeded = false;
    protected boolean playerDidGet2ScrumsWhenPreviouslyImpeded=false;
    //protected int numberOfDice=1;
    protected boolean isBurnUp=false;
    protected Pawn piece;
    protected ConcreteSubject subject;

    public ConcretePlayer()
    {
    }

    public ConcretePlayer(ConcreteSubject theSubject, Pawn piece, boolean turn,Days day )
    {
        this.subject = theSubject ;
        this.piece = piece;
        this.isPlayerTurn=turn;
        this.day=day;
        for(int i=0;i<11;i++)
        {
            dayTracker[i]=0;
        }        
        //         this.firstTurn=true;
    }

    public void update() 
    {
        // do nothing
    }

    public int getPlayerCurrentPositionID()
    {

        return this.playerCurrentPositionID;
    }
    public int getPlayerPreviousPositionID()
    {
        return this.playerPreviousPositionID;
    }

    public int getNumberOfEODs()
    {
        return 0;
    }

    public void setNumberOfEODs(int numberOfEODs)
    {
        //this.numberOfEODs = numberOfEODs;
    }

    public int getDiceCount()
    {
        return numberOfDiceEarned;
    }

    public void updateAtributes()
    {

    }
    public void updateConsumedDays()
    {
        
    }
}

