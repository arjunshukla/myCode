
/**
 * Write a description of class GreenPawnFactory here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class GreenPawnFactory extends PawnCreator
{
    public PawnFactory getPawn()
   {
       return new GreenPawn();
    }
}