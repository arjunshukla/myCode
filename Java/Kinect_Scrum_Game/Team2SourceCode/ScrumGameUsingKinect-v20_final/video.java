import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * how to install and use! (for windows users)
 * 
 * 1.download video to jpeg program (i used this http://www.dvdvideosoft.com/download/FreeVideoToJPGConverter.exe)
 * 2.run and follow the program.
 * 3.remove the preveous images and put your new images into the images folder in the greenfoot folder.
 * 4.highlight all of the images and right click on them.
 * 5. click rename
 * 6.rename it "video" (leave out the speech marks and the any spaces.)
 * 7.now run the player. it should work tell me if it dont. 
 * 8. enjoy. this will work online. (on greefoot and other sites
 * 
 * notice:
 * click space to pouse and play.
 * 
 * @author tyler simmonds (tylers) 
 * @version 1.01
 * 
 */
public class video extends Actor// implements Invoker
{
    int frame2 = 0;
    int frame3 = 0;
    int frame = 0;
    int frameH = 9;
    int frame2H = 100;
    int time = 0;
//     String name ="video (";
String name ="Video ";
    String brak = ")";
    boolean stop = false;
    //Command cmd;
    /**
     * Act - do whatever the video wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    public void act() 
    {        

        if(!stop)
            try
            {
                frame ++;
                setImage(name+frame+".jpg");//+brak+".jpg"); 
            }
            catch (java.lang.IllegalArgumentException iae)
            {
                stop = true;
                VideoWorld.finished();
        }


        if("space".equals(Greenfoot.getKey()))    
        {
            if(!stop){
                stop = true;
                VideoWorld.finished();
                //setCommand();
               // invoke();
            }
            else
            {
                stop=false;
                VideoWorld.unfinished();
            }
        }

        getImage().scale(600,400);
    }    
//Command Pattern 
    public void setCommand(Command cmd) {
       // theCommand = cmd ;
    }

    public void invoke() {
     //   theCommand.execute();
    }
}
