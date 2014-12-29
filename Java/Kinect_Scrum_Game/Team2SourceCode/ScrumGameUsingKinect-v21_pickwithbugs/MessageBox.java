import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.*; 

/**
 * Write a description of class MessageBox here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class MessageBox extends Actor
{
    MessageBox msg;
   
     
    
    public MessageBox()  
    {  
        GreenfootImage image = getImage() ;
        image.scale( 500,800) ;
    }
    
    public MessageBox(String text)  
    {  
        updateImage(text);  
        GreenfootImage image = getImage() ;
        image.scale( 250, 200 ) ;
    }  
      
    public void setText(String text)  
    {  
        updateImage(text);  
    }  
      
    public void updateImage(String text)  
    {  
        
        setImage(new GreenfootImage(text, 20, Color.blue, Color.white)); 
        System.out.println("printed");
       // Greenfoot.delay(1000000);
       removeMsg(this); 
     }  

    public void removeMsg(Actor actor)
    {
       GameScreen w=(GameScreen)getWorld();
       w.removeObject(actor);
    }
    public void act() 
    {
        // Add your action code here.
    }    
}

