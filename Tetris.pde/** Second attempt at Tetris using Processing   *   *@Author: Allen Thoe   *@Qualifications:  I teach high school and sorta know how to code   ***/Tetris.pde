/** Second attempt at Tetris using Processing
  *
  *@Author: Allen Thoe
  *@Qualifications:  I teach high school and sorta know how to code
  ***/

Grid grid;
ArrayList<Shape> shapes = new ArrayList<Shape>();

public void setup(){
  grid = new Grid();
  size(360,720);
  strokeWeight(3);
  stroke(50);
  shapes.add(new Shape());
}

public void draw(){
  background(0);
  grid.display();
  drawShapes();
}

public void drawShapes(){
  shapes.get(0).isActive = !shapes.get(0).checkSide("FLOOR");
  for(int i = 0; i < shapes.size(); i++){
    shapes.get(i).display();  
  }  
 
  if(!shapes.get(0).isActive){
    shapes.add(0, new Shape());  
  }
  
}
public void keyPressed(){
  
     if(keyCode==RIGHT && shapes.get(0).checkSide("RIGHT")){
      for(int i = 0; i < 4; i++){
        shapes.get(0).piece[i][0]++;
      }
    } else if(keyCode==LEFT && shapes.get(0).checkSide("LEFT")){
      for(int i = 0; i < 4; i++){
        shapes.get(0).piece[i][0]--;
      }
    } else if(keyCode==DOWN && shapes.get(0).checkSide("DOWN")){
      for(int i = 0; i < 4; i++){
        shapes.get(0).piece[i][1]++;
      }
    } 
}

public void keyReleased(){
    if(keyCode==UP){
      for(int i = 0; i < 4; i++){
        shapes.get(0).rotateShape();
      }
    } shapes.get(0).rotCount++;
}
