/**
 * Write a description of class DumyDice here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.*; 

public class DummyDice extends Actor 
{
    // instance variables - replace the example below with your own
    //private int displayNumber;

    /**
     * Constructor for objects of class DumyDice
     */
    public DummyDice()
    {
        //displayNumber=number;
        //displayDice();
    }

    public void displayDice(int number)
    {
        switch(number)
        {
            case 1:
            {
                this.setImage("dice1.png");
                break;
            }
            case 2:
            {
                this.setImage("dice2.png");
                break;
            }
            case 3:
            {
                this.setImage("dice3.png");
                break;
            }
            case 4:
            {
                this.setImage("dice4.png");
                break;
            }
            case 5:
            {
                this.setImage("dice5.png");
                break;
            }
            case 6:
            {
                this.setImage("dice6.png");
                /* from kinectHand close */
                GameScreen.shouldPlayerPickCard = false;
                KinectHand.isToolsCardPicked=false;
                KinectHand.isOpportunityCardPicked=false;
                KinectHand.isImpedimentCardPicked=false;
                KinectHand.isCardPicked = false;  
                /* */
                break;
            }

            default:
            {
                //                     this.setImage("dice1.png")
                break;
            }
        }
    }
}
