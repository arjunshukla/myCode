import greenfoot.*;
/**
 * Write a description of class BluePawn here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class BluePawn extends Pawn implements PawnFactory
{
    
    public BluePawn()
    {

        //super(day);
        setColor("BLUE");
        dx=0;
        dy=0;
        //this.day=day

    }
    
    public void setColor(String color)
    {
        this.color=color;
    }

    public void act()
    {
        if(Greenfoot.mouseClicked(this))
        {
            int x,y;
            x=this.getX();
            y=this.getY();
            System.out.println("hello"+x + " " +y);
        }
    }

    
    
    
}