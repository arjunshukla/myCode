import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.Font;
import java.awt.Color;

public class Label extends Actor
{
   GreenfootImage img; 
    
   public Label (String s)  { 
        GreenfootImage img = new GreenfootImage(s,  20, Color.BLACK, null); 
        setImage(img); 
    }
   
    public Label (String s,  Color c, int size) {
        GreenfootImage img = new GreenfootImage(s, size, c, null);  

        setImage(img); 
    }

    public void act() {      
    }
    
}
 