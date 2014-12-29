import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.Color; 
/**
 * Write a description of class CreditsScreen here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class CreditsScreen extends Screen
{
    private MenuCommand slot1;
 
    public CreditsScreen()
    {    
        // Create a new world with 600x400 cells with a cell size of 1x1 pixels.
        super( );
        slot1 = new MenuCommand(new GameScreen()); 
 
        prepare();
    }

    /**
     * Prepare the world for the start of the program. That is: create the initial
     * objects and add them to the world.
     */
    private void prepare()
    {
        Button button = new Button("Start Game!");
        addObject(button, 100, 300);
        button.setCommand(slot1);

//         Label label = new Label("Credits", Color.black, 24);
//         addObject(label, 89, 53);
//  
//         Label label2 = new Label("Professor: Paul Nguyen", java.awt.Color.BLUE, 16);
//         addObject(label2, 128, 93);
//         
//         Label label3 = new Label("Arjun Shukla", java.awt.Color.BLUE, 16);
//         addObject(label3, 128, 133);
//         Label label4 = new Label("Ayush Chouske", java.awt.Color.BLUE, 16);
//         addObject(label4, 128, 173);
//         Label label5 = new Label("Pooja Shukla", java.awt.Color.BLUE, 16);
//         addObject(label5, 128, 213);
//         Label label6 = new Label("Praveen Karkhile", java.awt.Color.BLUE, 16);
//         addObject(label6, 128, 253);
//         Label label7 = new Label("", java.awt.Color.BLUE, 16);
//         addObject(label7, 128, 293);
//         Label label8 = new Label("", java.awt.Color.BLACK, 16);
//         addObject(label8, 128, 333);

// Adding KinectPointer
        KinectPointerInfo pointer = new KinectPointerInfo();
        addObject(pointer,400,400);
    }
}
