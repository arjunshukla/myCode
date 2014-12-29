import greenfoot.*;
/**
 * Write a description of class RedPawn here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class RedPawn extends Pawn implements PawnFactory
{
    public RedPawn()
    {

        //super(day);

        setColor("RED");
        dx=-4;
        dy=4;

    }
    
    public void setColor(String color)
    {
        this.color=color;
    }
}
