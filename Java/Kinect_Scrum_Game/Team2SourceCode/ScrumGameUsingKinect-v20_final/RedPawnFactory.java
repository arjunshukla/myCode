
/**
 * Write a description of class RedPawnFactory here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class RedPawnFactory extends PawnCreator
{
    public PawnFactory getPawn()
   {
       return new RedPawn();
   }
}