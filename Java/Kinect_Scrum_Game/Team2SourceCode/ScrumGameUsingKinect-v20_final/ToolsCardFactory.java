import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.*;
import java.awt.*;/**
 * Write a description of class ToolsCard here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ToolsCardFactory extends Cards
{
    /**
     * Act - do whatever the ToolsCard wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    DisplayCard dc;
    MessageBox msg;
//     static String tools[]={"tool1.PNG",
//             "tool2.PNG",
//             "tool3.PNG",
//             "tool4.PNG",
//             "tool5.PNG",
//             "tool6.PNG",
//             "tool7.PNG",
//             "tool8.PNG",
//             "tool9.PNG",
//             "tool10.PNG",
//             "tool11.PNG",
//             "tool12.PNG",
//             "tool13.PNG",
//             "tool14.PNG",
//             "tool15.PNG",
//             "tool16.PNG",
//             "tool17.PNG",
//             "tool18.PNG",
//             "tool19.PNG",
//             "tool20.PNG",
//             "tool21.PNG"};
    static String tools[]={"tool1.png",
            "tool2.png",
            "tool3.png",
            "tool4.png",
            "tool5.png",
            "tool6.png",
            "tool7.png",
            "tool8.png",
            "tool9.png",
            "tool10.png",
            "tool11.png",
            "tool12.png",
            "tool13.png",
            "tool14.png",
            "tool15.png",
            "tool16.png",
            "tool17.png",
            "tool18.png",
            "tool19.png",
            "tool20.png",
            "tool21.png"};

    public ToolsCardFactory(DisplayCard dc,MessageBox msg)
    {
        this.dc=dc;
        this.msg=msg;
    }

    public void act() 
    {

        if(KinectHand.isToolsCardPicked)
        //         if(Greenfoot.mouseClicked(this) || this.getOneIntersectingObject(KinectHand.class)!=null)
        {
            ArrayList al=new ArrayList();
            for(int i=0;i<21;i++)
            {
                al.add(i);
            }
            Collections.shuffle(al);
            Queue<Integer> q = new LinkedList<Integer>();

            for(int i=0;i<al.size();i++)
            {
                q.add((Integer)al.get(i));

            }

            //dc=w.getDisplayCard();
            int pointer=dc.getNextCard(q);
            System.out.println(pointer);

            GameScreen w=(GameScreen)getWorld();

            w.getDisplayCard().setImage(tools[pointer]);//adding display card to the world
//             msg=w.getMessageBox();//adding msg object to the world
            //w.addObject(msg,395,270);

            dc.displayImageCard(w);
            //w.getMessageBox();
          //  w.addObject(msg,400,270);

            GameScreen.shouldPlayerPickCard = false;
            KinectHand.isToolsCardPicked = false;
        }
    } 
}

