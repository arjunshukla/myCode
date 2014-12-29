import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class KinectPointer here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class KinectPointer extends Actor
{
    private UserData[] users;

    /**
     * Act - do whatever the KinectPointer wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    public void act() 
    {
        // Add your action code here.
        MainScreen w = (MainScreen)getWorld();
        users = w.getTrackedUsers();

        for (UserData user : users)
        {
            Joint rightHand = user.getJoint(Joint.RIGHT_HAND);
            this.setLocation(rightHand.getX(),rightHand.getY());
        }
    }    
}
