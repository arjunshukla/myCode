import greenfoot.*; 
import java.awt.*;
import java.awt.Color; // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

public class TextField extends Actor    
{    
  
    public GreenfootImage label;  

    public TextField(int h, int w)  
    {  
        label=new GreenfootImage(h,w);
        setImage(label);       
    }  
    public void setText(String text)    
    {    
        label.clear();
        //label.setFont(new Font("Serif", Font.BOLD, 28));
        
        label.drawString(text,0,20);  
    } 
    public void setColor(Color c)
    {
        label.setColor(c);
    }
    public void setFont(Font f)
    {
        label.setFont(f);
    }
}    
