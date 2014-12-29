import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.*;
/**
 * Write a description of class ImpedimentCard here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ImpedimentCardFactory extends Cards
{
    GameScreen w=(GameScreen)getWorld();
    DisplayCard dc;
    MessageBox msg;

    static String impediments[]={"i1.png",
            "i2.png",
            "i3.png",
            "i4.png",
            "i5.png",
            "i6.png",
            "i7.png",
            "i8.png",
            "i9.png",
            "i10.png",
            "i11.png",
            "i12.png",
            "i13.png",
            "i14.png",
            "i15.png",
            "i16.png",
            "i17.png",
            "i18.png",
            "i19.png",
            "i20.png"};
    public ImpedimentCardFactory(DisplayCard dc,MessageBox msg)
    {
        this.dc=dc;
        this.msg=msg;
    }

    public void act()
    {

        if(KinectHand.isImpedimentCardPicked)
        {

            //        GameScreen w=(GameScreen)getWorld();

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

            w.getDisplayCard().setImage(impediments[pointer]);//adding display card to the world
            //adding msg object to the world

            dc.displayImageCard(w);
//             w.getMessageBox();
//             w.addObject(msg,380,350);

            GameScreen.shouldPlayerPickCard = false;
            KinectHand.isImpedimentCardPicked = false;
        }

    }
}

