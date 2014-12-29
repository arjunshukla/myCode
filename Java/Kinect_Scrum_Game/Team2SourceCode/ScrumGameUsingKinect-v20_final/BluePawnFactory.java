
/**
 * Write a description of class BluePawnFactory here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class BluePawnFactory extends PawnCreator
{
    public PawnFactory getPawn()
   {
       return new BluePawn();
    }
}
