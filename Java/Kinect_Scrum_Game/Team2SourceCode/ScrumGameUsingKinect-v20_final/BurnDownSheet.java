import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.*;
/**
 * Write a description of class BurnDownSheet here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class BurnDownSheet extends Actor
{
    /**
     * Act - do whatever the BurnDownSheet wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    public void act() 
    {
        // Add your action code here.
        if(Greenfoot.mouseClicked(this))
        {
            plot();
        }
    }    
    
    public void plot()
    {
        GreenfootImage art = getWorld().getBackground();////new GreenfootImage(300,300); /  
        art.setColor(Color.BLUE);  
        art.drawLine(50,250,100,100);
        art.drawLine(100,100,300,200);
        art.drawLine(300,200,100,100);

//         this.setImage(art);
//         int thickness = 20;   // set the thickness here.  
// 
//         for(int i=0;i<thickness;i++){  
//             for(int j=0;j<thickness;j++){  
//                 art.drawLine(0+i,100+j,200+i,100+j);              
//             }  
//         }  
    }
}
