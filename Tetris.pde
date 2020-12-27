//This is a Tetris Game designed by Jack Adiletta


//colors
public color green = color(0, 255, 0);
public color red = color(255, 0, 0);
public color blue = color(0, 0, 255);
public color yellow = color(255, 246, 41);
public color orange = color(255, 181, 41);
public color purple = color(113, 41, 255);
public color black = color(0,0,0);
public color white = color(255,255,255);

color[] colors = {green, red, blue, yellow, orange, purple};

public boolean keyChange = false;
public float timeLeft = 1000;
GameBoard Board = new GameBoard();
Tetrimino newPiece;
public int score=0;
int timer = 0;
void setup(){
  size(300,650);
  background(white);
  Board.drawField();
  newPiece = new Tetrimino(20);
  Board.addPieceToField(newPiece);
  textSize(40);
  fill(black);
  text("Score: ", 0, 640);
}

void loop(){

}
void draw(){
  if(Board.gameOver()==false){
    if(millis()-timer>=(int)timeLeft){
      handle();
      timeLeft= timeLeft-.1;
      timer = millis();
    }
  }
  fill(white);
  rect(150,600,150,50);
  textSize(40);
  fill(black);
  textAlign(RIGHT);
  text(score, 290, 640);
 if(Board.gameOver()){
    fill(black);
    rect(0,0,300,650);
    fill(white);
    textSize(32);
    text("Game Over", 230, 300);
    if(millis()>timer+5000){
    exit();}
  }
}
void handle(){
  Board.shiftDown();
  if(Board.getResetPiece()){
    score+=100;
    Board.addPieceToField(new Tetrimino((int)random(25)));
    Board.setResetPiece(false);
    score+=Board.checkForTetris();
  }
}

void keyPressed() {
  if(key == CODED){
    if(keyCode == DOWN && keyChange==false){
      Board.shiftDown();
      keyChange= true;
    } else if(keyCode == RIGHT && keyChange==false){
      Board.shiftRight();
      keyChange= true;
    } else if(keyCode == LEFT && keyChange==false){
      Board.shiftLeft();
      keyChange= true;
    }
  } else {
    if(key == 'd' && keyChange==false){
      Board.rotatePieceRight();
      keyChange= true;
    } else if(key == 'a' && keyChange==false){
      Board.rotatePieceLeft();
      keyChange= true;
    }
  }
}
void keyReleased(){
  keyChange = false;
}
