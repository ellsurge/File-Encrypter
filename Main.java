// import java.io.File;
import java.util.Scanner;
import java.util.ArrayList;

public class Main extends ZipDirectory {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        System.out.println("what you wanna do ------------------  e - encrypt/ d - decrypt");
        String ch = input.nextLine();
        // input.close();

        switch (ch) {
            case "e":

            ListFileDirectory files = new ListFileDirectory();
            ArrayList<String> fa = files.getDir();
            System.out.println("....................Select A Folder index..................");
            fa.forEach((e)->{System.out.println(fa.indexOf(e)+" : "+e);});
            int ai  = input.nextInt();
            String folder = fa.get(ai);
            // ZipDirectory zip = new ZipDirectory();
            boolean stepCheck = false;
            try {
                mains(folder, folder);
                stepCheck =true;
                
            } catch (Exception e) {
                
                e.printStackTrace();
                stepCheck = false;

            }
            if(stepCheck == false){
                System.out.println("something went wrong");
            }else if(stepCheck == true){
                
            }
            

            // ZipDir zid = new ZipDir(folder);

            // System.out.println(folder);
            // ZipDir<>;
            

 
                
                break;
            case "d":
            System.out.println("d selected");
                break;
            default:
                break;
        }
        

        input.close();

    
    }

}