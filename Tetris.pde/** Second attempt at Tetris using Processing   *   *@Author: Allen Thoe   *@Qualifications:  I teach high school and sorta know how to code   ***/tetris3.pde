/** Third attempt at Tetris using Processing
  *
  *@Author: Allen Thoe, Kenon Willis
  *@Qualifications:  Couple of high school teachers ;)
  ***/
Background bg;
Grid grid;
//ArrayList<Shape> shapes = new ArrayList<Shape>();
Shape shape, onDeck;


public void setup(){
  bg = new Background();
  grid = new Grid();
  size(360,720);
  strokeWeight(3);
  stroke(50);
  shape = new Shape();
  onDeck = new Shape();

}

void draw(){
  bg.display();
  grid.display();
  drawShapes();
}

void drawShapes(){
  shape.display();
  if(shape.checkBack(bg)){
    shape.isActive = false;
  }
  if(!shape.isActive){
    if(shape.isOnFloor){
       bg.writeShape(shape);
       shape = onDeck;
       onDeck = new Shape();
    } else if (shape.count%50==0){
      shape.isOnFloor = true;
    }
      
  }
}
public void keyPressed(){
  
    if(keyCode==RIGHT && shape.checkSide("RIGHT")){
      for(int i = 0; i < 4; i++){
        shape.piece[i][0]++;
      }
    } else if(keyCode==LEFT && shape.checkSide("LEFT")){
      for(int i = 0; i < 4; i++){
        shape.piece[i][0]--;
      }
    } else if(keyCode==DOWN && shape.checkSide("DOWN")){
      for(int i = 0; i < 4; i++){
        shape.piece[i][1]++;
      }
    } 

}

public void keyReleased(){

   if(keyCode==UP){
      for(int i = 0; i < 4; i++){
        shape.rotateShape();
      }
    } shape.rotCount++;  
}
