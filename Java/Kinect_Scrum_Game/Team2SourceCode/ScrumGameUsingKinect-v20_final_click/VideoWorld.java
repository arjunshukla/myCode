import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class myWorld here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class VideoWorld extends Screen
{
    video video1;
    static sound sound;
    /**
     * Constructor for objects of class myWorld.
     * 
     */
    public VideoWorld()
    {    
        // Create a new world with 600x400 cells with a cell size of 1x1 pixels.
        //super(600, 400, 1); 
        video1 = new video();
        addObject(video1,350,300);
        Greenfoot.setSpeed(40);
        sound = new sound();
       

    }
    public void started(){
        sound.play(100);
    }
    public void stopped(){     
        sound.stop();
    }
    public static void finished(){
        sound.stop();
        Greenfoot.setWorld(new MainScreen());
    }
    public static void unfinished(){
        sound.play();
    }
}
