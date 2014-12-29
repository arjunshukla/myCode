import greenfoot.*;
/**
 * Write a description of class GreenPawn here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class GreenPawn extends Pawn implements PawnFactory
{
    public GreenPawn()
    {

        //super(day);

        setColor("GREEN");
        dx=4;
        dy=-4;

    }
    
    public void setColor(String color)
    {
        this.color=color;
    }
    
    public void act()
    {
    }
}
