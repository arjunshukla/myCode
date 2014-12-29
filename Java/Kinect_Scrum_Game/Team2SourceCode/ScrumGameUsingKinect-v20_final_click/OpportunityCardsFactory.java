
/**
 * Write a description of class OpportunityCardsFactory here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class OpportunityCardsFactory extends CardCreator
{
   public CardFactory getCard()
    {
        return new OpportunityCards();

    }
}
