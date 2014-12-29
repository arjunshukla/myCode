import greenfoot.*;
/**
 * Write a description of class YellowPawn here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class YellowPawn extends Pawn implements PawnFactory
{
    public YellowPawn()
    {

        //super(day);

        setColor("YELLOW");
        dx=-4;
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
