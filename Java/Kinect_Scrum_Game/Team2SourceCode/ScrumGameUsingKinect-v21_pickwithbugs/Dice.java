import greenfoot.*;
import java.util.ArrayList;
import java.awt.*;
import java.awt.Color;
/**
 * Write a description of class Die here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

public class Dice extends Actor implements DiceFactory
{

    // for number of dice greater than 1
    private DummyDice[] dummyDice= new DummyDice[10];
    private ArrayList<ConcretePlayer> dummyPlayers=new ArrayList<ConcretePlayer>();
    private GameScreen w;
    public static int diceCount=0;
    private ConcretePlayer ply;
    private int[] dice= new int[10];
    GreenfootImage art ;
    boolean flag_plot=false;
    boolean flag_EOD=false;
    // represents the number on dice

    // for days
    private Days daysForBluePawn, daysForRedPawn, daysForGreenPawn, daysForYellowPawn;;

    private RollDice roll; // Subject
    //private ConcretePlayer [] players =new ConcretePlayer[4]; // Observers
    private ArrayList<ConcretePlayer> players;// =new ArrayList<ConcretePlayer>();
    // gravity
    int dy = 1;
    int g = 1;

    public static boolean isDiceFalling=false;

    public Dice(){}
    //     public Dice(RollDice roll, ConcretePlayer[] playerObject )
    public Dice(GameScreen w, RollDice roll, ArrayList<ConcretePlayer> playerObject,DummyDice[] dummyDice) //Days daysForBluePawn, Days daysForRedPawn, Days daysForGreenPawn, Days daysForYellowPawn,
    {
        this.w=w;
        this.roll = roll;
        this.daysForBluePawn=daysForBluePawn;
        this.daysForRedPawn=daysForRedPawn;
        this.daysForGreenPawn=daysForGreenPawn;
        this.daysForYellowPawn=daysForYellowPawn;
        players=new ArrayList<ConcretePlayer>(playerObject);

        for(int i=0;i<10;i++)
        {
            this.dummyDice[i]=dummyDice[i]  ;
        }

        w = (GameScreen)getWorld();
    }

    public void act()
    {

        if(true)
        {
            //falling dice
            if(this.isDiceFalling)          //  Greenfoot.mouseClicked(this))
            {
                //   System.out.println("die will fall");
                this.setImage("diceSpin.png");
                this.setLocation(getX(),getY()+dy);
                dy=dy+g;
                

                if(this.getY()>575)
                {
                    //                 this.setImage("");
                    Greenfoot.playSound("rolldice.mp3");
                    this.setLocation(500, 500);
                    isDiceFalling = false;
                    KinectHand.isDiceInHand=false;
                    
                    this.setImage("dice.png");

                    //                     if(!KinectHand.shouldPlayerPickPawn)
                    //                     {
                    rollDice();
                    KinectHand.shouldPlayerPickPawn=true;
                    //                     }


                }

            } 
        }
        else
        {
            if (true && !players.isEmpty())//*///Greenfoot.mouseClicked(this))
            {
                rollDice();
            }
        }
        int i=0;
        GreenfootImage art = getWorld().getBackground();
        art.setColor(Color.green);
        art.drawLine(50, 100, 50, 350);
        art.drawLine(50, 350, 300, 350);
        while(i<250)
        {
            art.drawLine(48, 100+i, 50, 100+i);
            int temp=i/25;
            art.drawString(Integer.toString(500-50*temp), 20, 102+i);
            i=i+25;
        }
        i=0;
        while(i<270)
        {
            art.drawLine(50+i, 350, 50+i,353);
            int temp=i/25;
            art.drawString(Integer.toString(temp), 50+i, 375);
            i=i+25;

        }

    }

    public void rollDice()
    {

        if((w.burnDownHours-w.burnedHours)>0)
        {
            int index;                  // to track the current player
            int diceValue = 0;          //Greenfoot.getRandomNumber(6);
            //int diceCount;
            this.setImage("diceSpin.png");
            ply = checkPlayerTurn(players);

            if (ply.getPlayerCurrentPositionID()>=15 && ply.getPlayerCurrentPositionID()<=21)
            {
                diceCount= w.progressDice; 
            }   
            else
            {
                for(int i=0;i<diceCount;i++)
                {
                    w.removeObject(dummyDice[i]);
                }
                diceCount=2;
            }

            System.out.println(ply.piece.getColor()+" turn");
            System.out.println("Total progress dice: " + w.progressDice + diceCount);

            if(ply.isFirstTurn) 
            {
                dice[0] = 1+ Greenfoot.getRandomNumber(6);
                System.out.println(dice[0]);
                ply.isFirstTurn=false;
                dummyDice[0].displayDice(dice[0]); 
                w.addObject(dummyDice[0],200, 550);
            }
            else
            {

                for(int i=0; i<diceCount;i++)
                {
                    dice[i]=1 + Greenfoot.getRandomNumber(6);
                    System.out.println(dice[i]);
                    dummyDice[i].displayDice(dice[i]); 
                    w.addObject(dummyDice[i],200+(i)*100, 550);
                }
            }

            int flag = 0;
            for(int i=0;i<diceCount;i++)
            {

                if(dice[i]==6)
                {
                    flag++;
                }
            }

            if(flag==1)
            {
                diceValue = 5;
            }

            if(flag==2)
            {
                diceValue = 6;
            }

            roll.setDiceNumber(dice);

            if(ply.getNumberOfEODs()<=10)
            {
                ply.updateAtributes();
            }   
            if(ply.getPlayerPreviousPositionID()>=15 && ply.getPlayerPreviousPositionID()<=21)
            {
                updateBurnedHours();
            }

            //             ply.isPlayerTurn=false;
            //             index = players.indexOf(ply);
            //             players.get((index+1)%players.size()).isPlayerTurn=true;
            System.out.println("Dice rolled");
            if(ply.piece.getLocation().equalsIgnoreCase("TOOL") && diceValue<6)
            {
                GameScreen.shouldPlayerPickToolCard = true;
                GameScreen.shouldPlayerPickCard = true;
                KinectHand.isCardPicked=true;
                GameScreen.shouldPlayerPickImpedimentCard = false;
                GameScreen.shouldPlayerPickOpportunityCard = false;
                KinectHand.shouldPlayerPickPawn=false;
            }
            else if(ply.piece.getLocation().equalsIgnoreCase("IMPEDIMENT") && diceValue<6)
            {
                Greenfoot.playSound("impediment.wav");
                GameScreen.shouldPlayerPickImpedimentCard = true;
                GameScreen.shouldPlayerPickCard = true;
                KinectHand.isCardPicked=true;

                GameScreen.shouldPlayerPickToolCard = false;
                GameScreen.shouldPlayerPickOpportunityCard = false;
                KinectHand.shouldPlayerPickPawn=false;
            }
            else if(ply.piece.getLocation().equalsIgnoreCase("OPPORTUNITY") && diceValue<6)
            {
                GameScreen.shouldPlayerPickOpportunityCard = true;
                GameScreen.shouldPlayerPickCard = true;
                KinectHand.isCardPicked=true;
                GameScreen.shouldPlayerPickToolCard = false;
                GameScreen.shouldPlayerPickImpedimentCard = false;
                KinectHand.shouldPlayerPickPawn=false;
            }
            if(ply.getPlayerCurrentPositionID()<6)
            {
                planSprint(ply);
            }

            for(ConcretePlayer p: players)
            {

                if(p.getPlayerCurrentPositionID()>5)
                {
                    flag_plot =true;
                }
                else
                {
                    flag_plot=false;
                }    
            }

            if(flag_plot)
            {
                GreenfootImage art = getWorld().getBackground();
                art.setColor(Color.green);
                art.drawLine(50,350-w.burnDownHours/2,300,350);
            }

            //             w.removeObject(art);
            //             art.drawString(Integer.toString(w.burnDownHours), 600, 450);
            //             art.clear();

            //             art.drawString(Integer.toString(w.burnDownHours-w.burnedHours), 600,351);

            System.out.println("Total target : "+ w.burnDownHours );
            System.out.println("Total BurnDown hours remaining : " + (w.burnDownHours-w.burnedHours));
            if(ply.numberOfEODs==10)
            {
                dummyPlayers.add(ply);
                players.remove(ply);
                System.out.println("Total Remaining Players: " + players.size());
                if(players.size()==0)
                {
                    if(w.burnDownHours>w.burnedHours)
                    {
                        System.out.println("GAME OVER!!! You lost :(" );          
                    }
                    else
                    {
                        System.out.println("Target Completed!!!"); 
                    }
                    plot();
                }
            }
        } 
        else
        {
            for(ConcretePlayer p:players)
            {
                p.piece.setLocation(575+p.piece.dx,415+p.piece.dy);
                p.piece.setBoardLocation("SPRINT REVIEW");
                //players.remove(p);
            }   
            System.out.println("Target Completed!!!");
            plot();
            System.out.println("Total target : "+ w.burnDownHours );
            System.out.println("Total BurnDown hours remaining : " + (w.burnDownHours-w.burnedHours));
        }
        this.setImage("dice.png");

        //ply.isPlayerTurn=false;

    }

    public ConcretePlayer checkPlayerTurn(ArrayList<ConcretePlayer> players)
    {
        ConcretePlayer player=new ConcretePlayer();

        for(ConcretePlayer ply:players)
        {
            if(ply.isPlayerTurn)
                player=ply;
        }

        return player;
    }

    public void addDelay(int delayTime)
    {
        try
        {
            Thread.sleep(delayTime);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public void planSprint(ConcretePlayer ply)
    {
        int i=ply.getPlayerCurrentPositionID();
        switch(i)
        {
            case 1 : w.burnDownHours=w.burnDownHours + 50;break;
            case 2 : w.progressDice=w.progressDice +1;break;
            case 3 : w.burnDownHours=w.burnDownHours + 25;break;
            case 4 : w.burnDownHours=w.burnDownHours - 25;break;
            case 5 : w.burnDownHours=w.burnDownHours + 50;break;
            default:break;
        }

    }

    public void updateBurnedHours()
    {
        int tempDiceCount;
        int scrumCount=0;
        int []tempDice=new int[10];
        int positionID=ply.getPlayerPreviousPositionID();
        int burnedHours=0;
        //GameScreen w =new GameScreen();
        scrumCount=getScrumCount();
        tempDiceCount=sortDiceValue(tempDice);
        System.out.println("printing Sorted Dice values: " + tempDiceCount);
        System.out.println("PositionID: " + positionID);
        for(int i=0;i<tempDiceCount;i++)
        {
            System.out.println(tempDice[i]);
        }
        for(int i=0;i<scrumCount;i++)
        {
            burnedHours=burnedHours + 2*(tempDice[i]);
        }
        if(scrumCount!=0)
        {
            for(int i=(scrumCount);i<tempDiceCount;i++)
            {
                burnedHours=burnedHours+tempDice[i];
            }
        }
        else
        {
            for(int i=0;i<tempDiceCount;i++)
            {
                burnedHours=burnedHours+tempDice[i];
            } 
        }

        switch (positionID)
        {

            case 15 :   burnedHours=burnedHours*2;
            w.burnedHours=w.burnedHours+burnedHours;
            break;

            case 16 :   w.burnedHours=w.burnedHours+burnedHours;
            break;

            case 17 :   burnedHours=burnedHours*2; 
            w.burnedHours=w.burnedHours+burnedHours; 
            break;

            case 18 :   w.burnedHours=w.burnedHours-burnedHours;
            break;

            case 19 :   w.burnedHours=w.burnedHours+burnedHours;
            break;

            case 20 :   burnedHours=burnedHours*2; 
            w.burnedHours=w.burnedHours+burnedHours;
            break;

            case 21 :  w.burnedHours=w.burnedHours-burnedHours;
            break;

            default :   w.burnedHours=w.burnedHours+burnedHours; 
            break;

        }
        System.out.println("BurnedHours:" + w.burnedHours);   
        ply.playerBurnedHours=ply.playerBurnedHours+burnedHours;
    }

    public int getScrumCount()
    {
        int count = 0;
        for(int i=0;i<Dice.diceCount;i++)
        {
            if(dice[i]==6)
            {
                count++;
            }
        }
        return count;
    }

    public int sortDiceValue(int []tempDice)
    {
        int swap;
        int temp=0;
        for(int i=0;i<Dice.diceCount;i++)
        {
            if(dice[i]!=6)
            {
                tempDice[temp]=dice[i];
                temp++;
            }
        }

        for (int c = 0 ; c < ( temp-1 ); c++)
        {
            for (int d = 0 ; d < (temp - c-1); d++)
            {
                if (tempDice[d] < tempDice[d+1]) /* For decreasing order use < */
                {
                    swap       = tempDice[d];
                    tempDice[d]   = tempDice[d+1];
                    tempDice[d+1] = swap;
                }
            }
        }
        return temp;
    }

    public void plot()
    {
        GreenfootImage art = getWorld().getBackground();
        art.setColor(Color.red);
        int x1,y1,x2,y2,temp;
        temp=0;
        int burnedHours=0;
        x1=50;
        y1=350-w.burnDownHours/2;
        x2=50;
        burnedHours=w.burnDownHours;

        for(int i=1;i<=10;i++)
        {
            System.out.println("..................................day : " + i);
            temp=0;
            for(ConcretePlayer p:dummyPlayers)
            {
                temp=temp+p.dayTracker[i]; 
                System.out.println(p.dayTracker[i]);

            }
            x2=x2+25;
            if(temp<burnedHours)
            {
                y2=350-(burnedHours-temp)/2;
            }
            else
            {
                y2=350;
            }

            art.drawLine(x1,y1,x2,y2);
            burnedHours=burnedHours-temp;
            x1=x2;
            y1=y2;
        }

    }

    public void DisplayLocations(ArrayList<ConcretePlayer> players)
    {
        for(ConcretePlayer p:players)
        {
            System.out.println(p.piece.getColor() + ":" + p.piece.getLocation());
            System.out.println(p.piece.getColor() + " PreviousPosition:" + GameScreen.cell[p.getPlayerPreviousPositionID()].getName());
            System.out.println(p.piece.getColor() + ": Days Consumed : " + p.getNumberOfEODs());
        }
        System.out.println("--------------------------------------------------------------------");
    }
}