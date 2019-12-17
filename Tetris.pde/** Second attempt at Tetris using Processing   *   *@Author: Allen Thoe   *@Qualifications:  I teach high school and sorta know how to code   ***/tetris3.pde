/** Second attempt at Tetris using Processing
  *
  *@Author: Allen Thoe
  *@Qualifications:  I teach high school and sorta know how to code
  ***/
Background bg;
Grid grid;
//ArrayList<Shape> shapes = new ArrayList<Shape>();
Shape shape, onDeck;


public void setup(){
  bg = new Background();
  grid = new Grid();
  size(720,720);
  strokeWeight(3);
  stroke(50);
  textSize(36);
  shape = new Shape();
  onDeck = new Shape();
  shape.isActive = true;

}

void draw(){
  bg.display();
  grid.display();
  drawShapes();
}

void drawShapes(){
  shape.display();
  onDeck.display();
  if(shape.checkBack(bg)){
    shape.isActive = false;
  }
  //TRYING TO MAKE IT SO THAT YOU DON'T AUTOMATICALLY END WHEN YOU HIT THE FLOOR--CAUSED A LOT OF PROBLEMS
  if(!shape.isActive){
    if(shape.isOnFloor){
       bg.writeShape(shape);
       shape = onDeck;
       shape.isActive = true;
       onDeck = new Shape();
    } else if (shape.count%50==0){
      shape.isOnFloor = true;
    } else {
      shape.showOnFloor();
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
