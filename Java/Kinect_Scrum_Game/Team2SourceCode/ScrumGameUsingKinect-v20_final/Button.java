import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.Color;  

public class Button extends Actor implements Invoker
{
    //int target; 
    private Command theCommand;

    /*
    public Button (String text, int target) { 
    this.target = target; 
    GreenfootImage image = new GreenfootImage( 120, 30); 
    image.clear();  
    image.setColor(new Color(34,100,68));  
    image.fill();  
    GreenfootImage numImage = new GreenfootImage(text, 24, Color.WHITE, new Color(34,100,68));  
    image.drawImage(numImage, 10, 15 - numImage.getHeight() / 2);
    setImage(image);        
    }act(
     */

    public Button (String text)
    { 
        GreenfootImage image = new GreenfootImage( 120, 30); 
        image.clear();  
        image.setColor(new Color(34,100,68));  
        image.fill();  
        GreenfootImage numImage = new GreenfootImage(text, 24, Color.WHITE, new Color(34,100,68));  
        image.drawImage(numImage, 10, 15 - numImage.getHeight() / 2);
        setImage(image);
    }


    public void act()
    {

        if (Greenfoot.mouseClicked(this) || this.getOneIntersectingObject(KinectPointer.class)!=null)
        {
            invoke(); 
        }
        else if(this.getOneIntersectingObject(KinectPointerInfo.class)!=null)
        {
            invoke();
        }

    } 

    //Command Pattern 
    public void setCommand(Command cmd) {
        theCommand = cmd ;
    }

    public void invoke() {
        theCommand.execute();
    }
}