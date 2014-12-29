import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class sound here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class sound
{
    private GreenfootSound music;
    public sound()
    {
        music = new GreenfootSound("KinectDemo.mp3");  
        music.setVolume(100);        

    }

    public void play(int sound){
        try
        {
            music.setVolume(sound);
            music.play();
        }
        catch( java.lang.IllegalArgumentException fail)
        {   System.err.println("                                                                        ");
            System.err.println("you put "+sound +" as the volume, the minmuim is zero and maxmin is 100.");
            System.err.println("//////////////////////////////////////////////////////////////////////");
            System.err.println(fail);
        }
     }

    public void stop(){        
        music.pause();
    }
    public void play(){        
        music.play();
    }
}
