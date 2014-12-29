
/**
 * Write a description of class ToolCardsFactory here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ToolCardsFactory extends CardCreator
{
    public CardFactory getCard()
    {
        return new ToolCards();

    }
}
