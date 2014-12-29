import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.*;
import java.util.*;
/**
 * Write a description of class DisplayCard here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class DisplayCard extends Actor
{
    /**
     * Act - do whatever the DisplayCard wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    DisplayCard displayCard;
    MessageBox updatemsg;

    public DisplayCard(MessageBox msg)
    {
        this.updatemsg=msg;
    }

    public void act() 
    {
        GreenfootImage img = new GreenfootImage(10, 50);  
        img.scale(10, 150);
    } 

    public void displayMessage(String toolsValue,GameScreen w)
    {

        System.out.println("Display Card"+toolsValue);
        w.addObject(this,395,270);
        w.addObject(updatemsg,395,270);
        updatemsg.updateImage(toolsValue);
       // updatemsg.upupdateImage(toolsValue);

        //Greenfoot.delay(1000);
        //removeCard(this,w);

    }
    public void displayImageCard(GameScreen w)
    {
         w.addObject(this,395,270);
    }
    public int getNextCard(Queue<Integer> q)
    {

        int element=q.poll();
        q.add(element);
        return element;
    }

    public void removeCard(Actor actor,GameScreen w)
    {

        w.removeObject(actor);
    }
}
