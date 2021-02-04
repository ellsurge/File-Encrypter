import java.io.File;
import java.util.ArrayList;
// import java.util.Scanner;


public class ListFileDirectory {

    public ArrayList<String> getDir(){
        File folder = new File(".");
        File dirs[] = folder.listFiles();

        ArrayList<String> fa = new ArrayList<String>();
        // int i = 0;
        for (File x : dirs) {
            if (x.isDirectory()) {
            // System.out.println(i+" :"+x.getName());
            fa.add(x.getName());
            // i++;
                
            }else{
            // System.out.println("pls put all files in a directory");
            }
            
        }
        return fa; 
    }    
}
