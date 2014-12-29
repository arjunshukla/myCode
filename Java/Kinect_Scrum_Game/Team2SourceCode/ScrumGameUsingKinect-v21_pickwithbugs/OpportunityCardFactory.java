import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.*;
/**
 * Write a description of class OpportunityCards here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class OpportunityCardFactory extends Cards
{
    /**
     * Act - do whatever the OpportunityCards wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    DisplayCard dc;
    MessageBox msg;

    static String opportunityCards[] = {"o1.PNG",  
            "o2.PNG",  
            "o3.PNG",  
            "o4.PNG",
            "o5.PNG",  
            "o6.PNG",  
            "o7.PNG",  
            "o8.PNG",
            "o9.PNG",  
            "o10.PNG",  
            "o11.PNG",  
            "o12.PNG",
            "o13.PNG",  
            "o14.PNG",  
            "o15.PNG",  
            "o16.PNG",
            "o17.PNG",  
            "o18.PNG",
            "o19.PNG"};
    
    //static GreenfootImage[] images = {new GreenfootImage("o1.png")};
//     static String opportunityCards[] = {"o1.png",  
//             "o2.png",  
//             "o3.png",  
//             "o4.png",
//             "o5.png",  
//             "o6.png",  
//             "o7.png",  
//             "o8.png",
//             "o9.png",  
//             "o10.png",  
//             "o11.png",  
//             "o12.png",
//             "o13.png",  
//             "o14.png",  
//             "o15.png",  
//             "o16.png",
//             "o17.png",  
//             "o18.png",
//             "o19.png"};

    public OpportunityCardFactory(DisplayCard dc,MessageBox msg)
    {
        this.msg=msg;
        this.dc=dc;
    }

    public void act() 
    {
        if(KinectHand.isOpportunityCardPicked)// || Greenfoot.mouseClicked(this))
        //          if(this.getOneIntersectingObject(KinectHand.class)!=null || Greenfoot.mouseClicked(this))
        {
            // 
            ArrayList al=new ArrayList();
            for(int i=0;i<19;i++)
            {
                al.add(i);
            }
            Collections.shuffle(al);
            Queue<Integer> q = new LinkedList<Integer>();

            for(int i=0;i<al.size();i++)
            {
                q.add((Integer)al.get(i));

            }

            int pointer=dc.getNextCard(q);
            System.out.println(pointer);

            GameScreen w=(GameScreen)getWorld();

            w.getDisplayCard().setImage(opportunityCards[pointer]);//adding display card to the world
            dc.displayImageCard(w);
            
            
            GameScreen.shouldPlayerPickCard = false;
            KinectHand.isOpportunityCardPicked = false;
        }
    }
}

