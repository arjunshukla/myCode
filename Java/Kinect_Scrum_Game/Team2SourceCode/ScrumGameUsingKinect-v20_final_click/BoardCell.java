/**
 * Write a description of class BoardCell here.
 * 
 * This Class represents the board cell on the game board
 * 
 * @author (Praveen Karkhile) 
 * @version (11/22/2014)
 */
public class BoardCell  
{
    
    private int xCordinate;
    private int yCordinate;
    private String name; 
    public BoardCell(){}

    public BoardCell(int x, int y, String name)
    {
        xCordinate = x;
        yCordinate = y;
        this.name = name;
    }
    public int getX()
    {
        return xCordinate;
    }
    public int getY()
    {
        return yCordinate;
    }
    public String getName()
    {
        return name;
    }
}

