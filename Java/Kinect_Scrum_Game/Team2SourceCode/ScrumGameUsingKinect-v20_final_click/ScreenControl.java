import greenfoot.*;  

//Invoker

public class ScreenControl  
{
    //static int next; 
    
    private static ScreenControl theController = null;
    private Screen current;
 
    public static ScreenControl getInstance() {
        if (theController == null) {
            theController = new ScreenControl();
            return theController;
        }
        else
            return theController;
    }
    
    
    public void setScreen(Screen screen)
    {
        this.current = screen;
        current.display(); 
    }   
}