import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.*;
/**
 * Write a description of class MainScreen here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class MainScreen extends Screen
{
    ScreenControl scr = new ScreenControl(); 
    GreenfootSound backgroundMusic = new GreenfootSound("1.mp3");
    private MenuCommand slot1;
    private MenuCommand slot2;
    private MenuCommand slot3;  

    public MainScreen()
    {    

        super();
        backgroundMusic.setVolume(40);
        backgroundMusic.playLoop();
        slot1 = new MenuCommand(new GameScreen());
        slot2 = new MenuCommand(new CreditsScreen());
        //         slot3 = new MenuCommand(new GameOverScreen());

        prepare();
    }

    private void prepare()
    {

        Button startBtn = new Button("PLAY");
        Button teamInfoBtn = new Button("TEAM 2");
        Button exitBtn = new Button("QUIT");

        startBtn.setCommand(slot1); 
        teamInfoBtn.setCommand(slot2); 
        exitBtn.setCommand(slot3); 

        //         addObject(startBtn, 95, 490);
        //         addObject(creditsBtn, 95, 530);
        //         addObject(exitBtn, 95, 570);

        addObject(startBtn, 350, 530);
        addObject(teamInfoBtn, 95, 500);
        addObject(exitBtn, 95, 550);

        // Adding KinectPointer
        KinectPointer pointer = new KinectPointer();
        addObject(pointer,500,500);

        GreenfootImage art = new GreenfootImage(100,100);  
        art.setColor(Color.YELLOW);  
        art.drawLine(500,500, 300, 300);
        //         art.drawLine(prevx, prevy, presx, presy);
        //         addObject(art,100,100);

        getBackground().drawImage(art, 100, 100);

        //         BurndownChart obj = new BurndownChart();
        //         obj.plotChart(10,10,100,100);
        //         addObject(obj,100,100);

    }
}
