import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class Pawn here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Pawn extends Actor
{
    /**
     * Act - do whatever the Pawn wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    protected String location="START";
    protected String color;
    //protected Days day;
    protected int dx;
    protected int dy;
    
//     public Pawn(Days day)
//     {
//         this.day=day;
//     }
    
    public void setBoardLocation( String loc)
    {
        location =loc;
    }
    
    public String getLocation()
    {
        return location;
    }
    
    public String getColor()
    {
        return color;
    }
    public void act() 
    {
        // Add your action code here.
    }    
}
