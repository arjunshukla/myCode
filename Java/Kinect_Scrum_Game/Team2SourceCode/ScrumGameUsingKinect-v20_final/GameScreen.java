import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.io.*;
import java.util.ArrayList;
import java.awt.*;
import java.awt.Color;
import java.awt.Font;
/**
 * Write a description of class GameScreen here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class GameScreen extends Screen
{
    private RollDice roll;
    private Pawn bluePawn, redPawn, greenPawn, yellowPawn,  blueDayPawn,greenDayPawn,redDayPawn,yellowDayPawn;
    private Days daysForBluePawn,daysForRedPawn,daysForGreenPawn,daysForYellowPawn;
    private Dice dice;
    public static DummyDice[] dummyDice=new DummyDice[10];
    public static boolean rollDiceFlag=false;
    public static boolean shouldPlayerPickCard = false;
    public static boolean shouldPlayerPickToolCard = false;
    public static boolean shouldPlayerPickImpedimentCard = false;
    public static boolean shouldPlayerPickOpportunityCard = false;
    private ConcretePlayer bluePlayer,greenPlayer,redPlayer,yellowPlayer;// Array of Observers
    private ArrayList<ConcretePlayer> players = new ArrayList<ConcretePlayer>();// Array of Observers
    public  static final BoardCell[] cell = new BoardCell[26]; // Board Cells
    public  int  burnDownHours=300;
    public  int  burnedHours=0;
    public  int  progressDice=3;
    public TextField target,burnDownChart,targetLable;

    private ToolsCardFactory tcf;
    private ImpedimentCardFactory icf;
    private OpportunityCardFactory ocf;

    private DisplayCard dc;
    private MessageBox msg;
    private Close close;
    private KinectHand objHand;

    // Burndown chart
    private BurnDownSheet objBurnDown;
    

    /**
     * Constructor for objects of class GameScreen.
     * 
     */
    public GameScreen()
    {    
        // Create a new world with 600x400 cells with a cell size of 1x1 pixels.
        //         super(600, 400, 1); 
        // Prepare Board Cell        
        cell[0]=new BoardCell(38,414,"START");
        cell[1]=new BoardCell(90,414,"SP +50");
        cell[2]=new BoardCell(140,414,"SP 1 DICE");
        cell[3]=new BoardCell(185,414,"SP +25");
        cell[4]=new BoardCell(230,414,"SP -25");
        cell[5]=new BoardCell(285,414,"SP +50");
        cell[6]=new BoardCell(400,410,"EOD");
        cell[7]=new BoardCell(503,354,"IMPEDIMENT");
        cell[8]=new BoardCell(535,288,"OPPORTUNITY");
        cell[9]=new BoardCell(533,232,"TOOL");
        cell[10]=new BoardCell(514,174,"EOD");
        cell[11]=new BoardCell(477,134,"IMPEDIMENT");
        cell[12]=new BoardCell(428,109,"OPPORTUNITY");
        cell[13]=new BoardCell(372,106,"TOOL");
        cell[14]=new BoardCell(322,130,"EOD");
        cell[15]=new BoardCell(285,170,"BURN START");
        cell[16]=new BoardCell(213,181,"DOUBLE DICE");
        cell[17]=new BoardCell(160,160,"DOUBLE DICE_2");
        cell[18]=new BoardCell(152,107,"DOUBLE DICE_UP");
        cell[19]=new BoardCell(181,71,"DOUBLE DICE");
        cell[20]=new BoardCell(233,61,"DOUBLE DICE_2");
        cell[21]=new BoardCell(263,102,"DOUBLE DICE_UP");
        cell[22]=new BoardCell(265,235,"IMPEDIMENT");
        cell[23]=new BoardCell(270,285,"OPPORTUNITY");
        cell[24]=new BoardCell(289,346,"TOOL");
        cell[25]=new BoardCell(575,415,"SPRINT REVIEW");

        for(int i=0;i<10;i++)
        {
            dummyDice[i]= new DummyDice();
        }
        prepare();
    }

    public void prepare()
    { 
        roll = new RollDice(); 

        daysForBluePawn = new Days();
        this.addObject(daysForBluePawn,581,211);
        daysForRedPawn = new Days();
        this.addObject(daysForRedPawn,610,211);
        daysForGreenPawn = new Days();
        this.addObject(daysForGreenPawn,641,211);
        daysForYellowPawn = new Days();
        this.addObject(daysForYellowPawn,671,211);

        //Blue Player
        bluePawn = new BluePawn();
        this.addObject(bluePawn,cell[0].getX(),cell[0].getY());

        //playerObj[0] = new Player(roll,bluePawn,true,daysForBluePawn);
        bluePlayer = new Player(roll,bluePawn,true,daysForBluePawn);

        players.add(bluePlayer);

        // Red Player
        redPawn = new RedPawn();
        this.addObject(redPawn,cell[0].getX()-5,cell[0].getY()-5);
        redPlayer = new Player(roll,redPawn,false,daysForRedPawn);

        players.add(redPlayer);

        // Green Player
        greenPawn = new GreenPawn();
        this.addObject(greenPawn, cell[0].getX()+5,cell[0].getY()+5);
        greenPlayer = new Player(roll,greenPawn,false,daysForGreenPawn);
        players.add(greenPlayer);

        // Yellow Player
        yellowPawn = new YellowPawn();
        this.addObject(yellowPawn,cell[0].getX()-10,cell[0].getY()-10);
        yellowPlayer = new Player(roll,yellowPawn,false,daysForYellowPawn);
        players.add(yellowPlayer);

        for (ConcretePlayer ply: players)
        {
            roll.attach(ply);
        }

        msg=new MessageBox(); 
        dc=new DisplayCard(msg);

        ocf=new OpportunityCardFactory(dc,msg);
        this.addObject(ocf,300,50);

        tcf=new ToolsCardFactory(dc,msg);
        this.addObject(tcf,450,50);

        icf=new ImpedimentCardFactory(dc,msg);
        this.addObject(icf,375,50);

        this.setPaintOrder(MessageBox.class,DisplayCard.class);

        // for days
        blueDayPawn = new BluePawn();
        this.addObject(blueDayPawn,580,90);
        redDayPawn = new RedPawn();
        this.addObject(redDayPawn,610,90);
        greenDayPawn = new GreenPawn();
        this.addObject(greenDayPawn,640,90);
        yellowDayPawn = new YellowPawn();
        this.addObject(yellowDayPawn,670,90);

        //Tartget Hours

        target=new TextField(150,150);
        target.setFont(new Font("Serif", Font.BOLD, 28));
        target.setColor(Color.RED);
        this.addObject(target,652,430);

        targetLable=new TextField(150,150);
        targetLable.setFont(new Font("Serif", Font.BOLD, 25));
        targetLable.setColor(Color.white);
        targetLable.setText("TARGET");
        this.addObject(targetLable,652,400);

        burnDownChart=new TextField(250,150);
        burnDownChart.setFont(new Font("Serif", Font.BOLD, 25));
        burnDownChart.setColor(Color.white);
        burnDownChart.setText("BURNDOWN CHART");
        this.addObject(burnDownChart,150,90);

        // Adding Dice to world..
        dice = new Dice(this, roll, players,dummyDice,target);//roll, playerObj);//daysForBluePawn,daysForRedPawn,daysForGreenPawn,daysForYellowPawn
        this.addObject(dice, 555, 500);

        // Add close button
        close = new Close();
        this.addObject(close, 550, 500);

        // Add Kinect hand
        objHand = new KinectHand();
        this.addObject(objHand, 655,515);

        
        //Burned Down Chart

        int i=0;
        GreenfootImage art =getBackground();
        art.setColor(Color.green);
        art.setFont(new Font("Serif", Font.BOLD, 15));
        art.drawLine(50, 50, 50, 350);
        art.drawLine(50, 350, 300, 350);
        while(i<300)
        {
            art.drawLine(48, 50+i, 50, 50+i);
            int temp=i/25;
            art.drawString(Integer.toString(600-50*temp), 20, 52+i);
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

        // Add burndown chart
        //         BurnDownSheet objBurnDown = new BurnDownSheet();
        //         this.addObject(objBurnDown,30,300);
    }

    public void act () { 
        super.act();
        if (!isConnected())
            return;
    }

    public Dice getDice()
    {
        return dice;
    }

    public OpportunityCardFactory getOpportunityCardFactory()
    {
        return ocf;
    }

    public ToolsCardFactory getToolsCard()
    {
        return tcf;
    }

    public ImpedimentCardFactory getImpedimentCard()
    {
        return icf;
    }

    public DisplayCard getDisplayCard()
    {
        return dc;
    }

    public MessageBox getMessageBox()
    {
        this.addObject(msg,395,270);
        return msg;
    }

    public KinectHand getKinectHandObject()
    {
        return objHand;
    }

}
