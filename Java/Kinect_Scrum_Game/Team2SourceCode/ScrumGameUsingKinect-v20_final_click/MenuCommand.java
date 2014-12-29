public class MenuCommand implements Command {

    //The Screen 
    private Receiver theReceiver ;
    
    public MenuCommand (Screen scr) { 
        this.theReceiver = scr; 
    }
    
    public void execute() {
        theReceiver.display();
    }

    public void setReceiver(Receiver target) {
        theReceiver = (Screen) target ;
    }
     
}
 
