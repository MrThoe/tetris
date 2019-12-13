public class Piece{
  
  private int shape[][];
  private int choice;  // 0 = line, 1 = leftL, 2 = rightL, 3 = tri, 4 = square
  private int w;
  private int c; //color deepness
  private int counter;
  
  //Objects are all 4 "blocks" -- (x,y) represent to corner of each "block"
  private final int[][] square = {{0,0}, {1,0}, {1,1}, {0,1}};   //{x,y}
  private final int[][] ln = {{0,0}, {1,0}, {2,0}, {3,0}}; 
  private final int[][] leftL = {{0,0}, {1,0}, {2,0}, {2,1}};
  private final int[][] rightL = {{0,0}, {0,1}, {1,0}, {2,0}};
  private final int[][] tri = {{0,0}, {1,0}, {2,0}, {1,1}};
  
  public Piece(){
    choice = (int)random(5);  
    w = width/10;
    c = 155;
  }
  
  public Piece(int n){
    choice = n;
    w = width/10;
    c = 155;  
 
  }
  
  public void display(){
    counter++;
    switch(choice){
      case 0: //square = orange
        fill(c,c,0);
        shape = square; 
        break;
      case 1:  //line = green
        fill(0, c, 0);  
        shape = ln;
        break;
      case 2:  //leftL = red
        fill(c, 0, 0);
        shape = leftL;
        break;
      case 3:  // right L = blue
        fill(0, 0, c); 
        shape = rightL;
        break;
      case 4:
        fill(c, 0, c); // tri = purple
        shape = tri;
        break;        
      default:
        fill(255);
        break;
    }
    for (int i = 0; i < shape.length; i++){
      rect(shape[i][0]*w, shape[i][1]*w, w, w);
    }  
  }
  

  public boolean checkLeft(){
    for(int i = 0; i < 4; i++){
         if(shape[i][0] == 0)
           return false;
       }
    return true;   
    }
    
  public boolean checkRight(){
    for(int i = 0; i < 4; i++){
         if(shape[i][0] == 9)
           return false;
       }
    return true;   
    }  
    
  public boolean checkBottom(){
    for(int i = 0; i < 4; i++){
         if(shape[i][1] == 19)
           return false;
       }
    return true;   
    }   
  
  public void move(int dir){
     if(counter%10 ==0 && checkBottom()){
         for(int i = 0; i < 4; i++){
           shape[i][1] += 1;
         }
     }
     switch(dir){
      case 0: // LEFT
         if(checkLeft()){
           for(int i = 0; i < 4; i++){
             shape[i][0] -= 1;
           }      
         }
         break;
      case 1:  // RIGHT
        if(checkRight()){
           for(int i = 0; i < 4; i++){
             shape[i][0] += 1;
           }
        }
        break;
        
      case 2:  // UP
       for(int i = 0; i < 4; i++){
         shape[i][1] -= 0;
       } //TODO ROTATION
       
        break;
        
      case 3:  // DOWN
        if(checkBottom()){
         for(int i = 0; i < 4; i++){
           shape[i][1] += 1;
         }
        }
        break;  
        
      default:
       for(int i = 0; i < 4; i++){
         shape[i][1] += 1;
       }
        break;
    }
  }
}
