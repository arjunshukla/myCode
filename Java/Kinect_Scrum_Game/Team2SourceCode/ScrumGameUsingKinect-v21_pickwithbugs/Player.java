import greenfoot.*;

public class Player extends ConcretePlayer
{
    public Player( ConcreteSubject sub , Pawn player, boolean turn, Days day)
    {
        super(sub, player, turn, day) ;
    }

    public void update()
    {
        if(isPlayerTurn)
        {
            int temp = 0;
            dice = subject.getDiceNumber();
            playerPreviousPositionID=playerCurrentPositionID;

            if(playerPreviousPositionID == 22 || playerPreviousPositionID == 11 || playerPreviousPositionID == 7)// 22,11,7
            {
                if(playerDidGet2ScrumsWhenPreviouslyImpeded)
                {
                    isPlayerImpeded=false;
                    playerDidGet2ScrumsWhenPreviouslyImpeded=false;
                }
                else
                {
                    isPlayerImpeded=true;
                }
            }
            else
            {
                isPlayerImpeded=false;
            }

            checkPlayerImpededStatus();

            movePawn();
            if (playerCurrentPositionID > 15 && playerPreviousPositionID<15)
            {
                playerCurrentPositionID=playerCurrentPositionID+6;
                positionAdjustment();
            }
            else
            {
                positionAdjustment();
            }
        } 
        //updateAtributes();
        //         setBurnDownPath();  
    }

    public void updateAtributes()
    {
        //if(!shouldPlayerPickPawn)
        updatePosition();

        updateEarnedDice();
        updateConsumedDays();
    }

    public void updatePosition()
    {
        int temp=getPlayerCurrentPositionID();
        int dx=this.piece.dx;
        int dy=this.piece.dy;
        //this.piece.setLocation(GameScreen.cell[temp].getX()+dx,GameScreen.cell[temp].getY()+dy);
        this.piece.setBoardLocation(GameScreen.cell[temp].getName());
    }

    public void updateEarnedDice()
    {
        if(this.piece.getLocation() == "SP 1 DICE")
        {
            numberOfDiceEarned=numberOfDiceEarned+1;
        }
    }

    public void updateConsumedDays()
    {
        if(this.piece.getLocation()=="EOD")
        {
            //System.out.println("entered into Days");
            String imgName = "day";

            numberOfEODs=numberOfEODs+1;
            imgName=imgName.concat(String.valueOf(numberOfEODs));
            imgName=imgName.concat(".png");
            //System.out.println("set Image: "+ imgName);
            this.day.setImage(imgName);
            dayTracker[numberOfEODs]=playerBurnedHours;
            playerBurnedHours=0;
            System.out.println("hours burned : "+ dayTracker[numberOfEODs]);
            System.out.println("Total Hours burned after : " + (numberOfEODs) + " days " + dayTracker[numberOfEODs]);

            if(numberOfEODs==10)
            {
                moveToSprintReview();
                this.isPlayerTurn=false;
                subject.detach(this);
            }   
        }
    } 

    public void moveToSprintReview()
    {
        this.piece.setLocation(575+this.piece.dx,415+this.piece.dy);
        this.piece.setBoardLocation("SPRINT REVIEW");
    }

    public void setBurnDownPath()
    {
        if (getPlayerCurrentPositionID()==15)
        {
            isBurnUp=true;
        }
        else
        {
            isBurnUp=false;
        }
    }

    public int getNumberOfEODs()
    {
        return numberOfEODs;
    }

    public void setNumberOfEODs(int numberOfEODs)
    {
        this.numberOfEODs = numberOfEODs;
    }

    public void positionAdjustment()
    {
        if(playerCurrentPositionID>=25)
        {
            int temp = (playerCurrentPositionID - 5)%19;
            playerCurrentPositionID = temp+5;
        }
    }

    public void checkPlayerImpededStatus()
    {
        int flag = 0;
        for(int i=0;i<2;i++)
        {
            if(dice[i]==6) // remove impediment
            {
                isPlayerImpeded = false;
                flag++;
            } 
        }

        if(flag>=2)
        {
            playerDidGet2ScrumsWhenPreviouslyImpeded=true;
        }
    }

    public void movePawn()
    {
        if(!isPlayerImpeded)// && playerDidGet2ScrumsWhenPreviouslyImpeded) //isPlayerImpeded==false
        {
            for(int i=0;i<Dice.diceCount;i++)
            {
                if(dice[i]!=6) // not SCRUM
                {   
                    playerCurrentPositionID = playerCurrentPositionID + dice[i];
                }
            }
        }
    }

    public Pawn getPawn()
    {
        return piece;
    }

    public int[] getDiceNumber()
    {
        
        return dice;
    }
}
