
/**
 * Write a description of class NormalDie here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class NormalDice extends DiceCreator
{
    public DiceFactory getDice()
    {
        return new Dice();
    }   
}
