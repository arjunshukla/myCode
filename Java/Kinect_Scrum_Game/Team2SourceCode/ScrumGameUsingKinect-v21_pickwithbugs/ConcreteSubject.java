

import java.util.ArrayList;

public class ConcreteSubject implements Subject {

    protected int[] diceNumber=new int[10];

    private ArrayList<Observer> players = new ArrayList<Observer>() ;

    public int[] getDiceNumber() {
        return diceNumber ;
    }

    public void setDiceNumber(int[] number) 
    {

        for(int i=0;i<Dice.diceCount;i++)
        {
            diceNumber[i]=number[i];
        }
        notifyPlayers();
    }

    public void attach(Observer ply) 
    {
        players.add(ply) ;
    }

    public void detach(Observer ply) 
    {
        players.remove(ply) ;
    }

    public void notifyPlayers() 
    {
        if (players!=null)
        {
            for (Observer ply  : players)
            {
                ply.update();
            }
        }   
    }

    public void showDiceNumber()
    {
        System.out.println( "number: " + this.getClass().getName() + " = " + diceNumber );
    }

}

