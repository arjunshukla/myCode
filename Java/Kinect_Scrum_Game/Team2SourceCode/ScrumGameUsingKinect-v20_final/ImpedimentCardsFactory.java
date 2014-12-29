
/**
 * Write a description of class ImpedimentCardsFactory here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ImpedimentCardsFactory extends CardCreator
{
   public CardFactory getCard()
    {
        return new ImpedimentCards();

    }
}
