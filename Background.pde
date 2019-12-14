public class Background{
  
  private int[][][] colors, newColors;
  private int r, g, b;
  private float w;
  private int x,y;  //index the piece x,y;
  private boolean isFull;
  
  //USE THE CONSTRUCTOR TO SET BACKGROUND COLOR (r,g,b)
  public Background(){
      colors = new int[12][24][3]; 
      w = width/12;
      for(int i = 0; i < 12; i++){
        for(int j = 0; j < 24; j++){
          colors[i][j][0] = 0;
          colors[i][j][1] = 0;
          colors[i][j][2] = 0;
        }
      }
  }
  
  //At the beginning of each 
  public void display(){
      for(int i = 0; i < 12; i++){
        for(int j = 0; j < 24; j++){
          r = colors[i][j][0];
          g = colors[i][j][1];
          b = colors[i][j][2];
          fill(r,g,b);
          rect(i*w, j*w, w, w);
        }
      } 
      for(int i = 0; i < 24; i++){  
        if(checkLine(i)){
          println("Full line~!");
          removeLine(i);
        }
      }
  }
  
  public boolean checkLine(int row){
        for(int j = 0; j < 12; j++){
          if(colors[j][row][0] == 0 && colors[j][row][1] == 0 && colors [j][row][2] == 0){
            return false;
          }   
        }
      
      return true;  
  }
  
  public void removeLine(int row){
      for(int i = 0; i < 12 ; i++){
        colors[i][row][0]=0;
        colors[i][row][1]=0;
        colors[i][row][2]=0;
      }
  }
  
  public void writeShape(Shape s){
    for(int i = 0; i < 4; i++){
        x = s.piece[i][0];  //Get the piece x and y
        y = s.piece[i][1];
        if(y >= 0 && x >= 0 && x < 12 && y < 24){
          colors[x][y][0] = s.r;
          colors[x][y][1] = s.g;
          colors[x][y][2] = s.b;
        }
    }
  }
  
}
