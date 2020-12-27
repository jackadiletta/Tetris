// Class definition for the gameBoard

class GameBoard {
  private color[][] field;
  int fieldWidth;
  int fieldHieght;
  int brickWidth = 30;
  private Tetrimino temp;
  private boolean resetPiece=false;
  public GameBoard(){
    field = new color[10][20];
    fieldWidth = field.length;
    fieldHieght = field[0].length;
    temp = null;
    for (int i = 0; i < fieldWidth; i++){
      for (int j = 0; j < fieldHieght; j++){
        field[i][j]=black;
      }
    }
    
  }
  public void shiftRight(){
   if(temp.getPiece()[3][0]+temp.getX()<9){
      erasePiece(temp);
      if(field[temp.getPiece()[0][0]+1+temp.getX()][temp.getPiece()[0][1]+temp.getY()]==black&&
         field[temp.getPiece()[1][0]+1+temp.getX()][temp.getPiece()[1][1]+temp.getY()]==black&&
         field[temp.getPiece()[2][0]+1+temp.getX()][temp.getPiece()[2][1]+temp.getY()]==black&&
         field[temp.getPiece()[3][0]+1+temp.getX()][temp.getPiece()[3][1]+temp.getY()]==black)
         {
      temp.addToCoordinates(1,0);
      drawField();
         }
   }
  }
  public void shiftLeft(){
    if(temp.getPiece()[0][0]+temp.getX()>0){
      erasePiece(temp);
      if(field[temp.getPiece()[0][0]-1+temp.getX()][temp.getPiece()[0][1]+temp.getY()]==black&&
         field[temp.getPiece()[1][0]-1+temp.getX()][temp.getPiece()[1][1]+temp.getY()]==black&&
         field[temp.getPiece()[2][0]-1+temp.getX()][temp.getPiece()[2][1]+temp.getY()]==black&&
         field[temp.getPiece()[3][0]-1+temp.getX()][temp.getPiece()[3][1]+temp.getY()]==black)
         {
        temp.addToCoordinates(-1,0);
        drawField();
          }
    }
  }
  public void shiftDown(){
    erasePiece(temp);
      if((temp.getPiece()[0][1]+1+temp.getY())<20&&
         (temp.getPiece()[1][1]+1+temp.getY())<20&&
         (temp.getPiece()[2][1]+1+temp.getY())<20&&
         (temp.getPiece()[3][1]+1+temp.getY())<20
         &&
        (field[temp.getPiece()[0][0]+temp.getX()][temp.getPiece()[0][1]+1+temp.getY()]==black&&
         field[temp.getPiece()[1][0]+temp.getX()][temp.getPiece()[1][1]+1+temp.getY()]==black&&
         field[temp.getPiece()[2][0]+temp.getX()][temp.getPiece()[2][1]+1+temp.getY()]==black&&
         field[temp.getPiece()[3][0]+temp.getX()][temp.getPiece()[3][1]+1+temp.getY()]==black)
        ){
        temp.addToCoordinates(0,1);
        drawField();
      } else {
        resetPiece = true;
        drawField();
      }
  }
  public void rotatePieceRight(){
    erasePiece(temp);
    if((temp.getType()+1)%4==0){
      temp.setType(temp.getType()-3);
    } else {
      temp.incrementType();
    }
     temp.setPiece(temp.getTetriminoConjugation(temp.getType()));
     if(temp.getPiece()[3][0]+temp.getX()>=9){
       temp.addToCoordinates(-1,0);
     }
     if(temp.getPiece()[0][0]+temp.getX()>=9){
       temp.addToCoordinates(-1,0);
     }
     if(temp.getPiece()[3][0]+temp.getX()<=0){
       temp.addToCoordinates(1,0);
     }
     if(temp.getPiece()[0][0]+temp.getX()<=0){
       temp.addToCoordinates(1,0);
     }
     drawField();
  }
  public void rotatePieceLeft(){
    erasePiece(temp);
    if((temp.getType())%4==0){
      temp.setType(temp.getType()+3);
    } else {
      temp.decrementType();
    }
     temp.setPiece(temp.getTetriminoConjugation(temp.getType()));
   if(temp.getPiece()[3][0]+temp.getX()>=9){
     temp.addToCoordinates(-1,0);
   }
   if(temp.getPiece()[0][0]+temp.getX()>=9){
     temp.addToCoordinates(-1,0);
   }
   if(temp.getPiece()[3][0]+temp.getX()<=0){
     temp.addToCoordinates(1,0);
   }
   if(temp.getPiece()[0][0]+temp.getX()<=0){
     temp.addToCoordinates(1,0);
   }
     drawField();
  } 
  
  public void addPieceToField(Tetrimino piece){
    temp = piece;
    drawField();
  }
  public void erasePiece(Tetrimino piece){
    for(int i = 0;i<4;i++){
      this.field[piece.getX()+piece.getPiece()[i][0]][piece.getY()+piece.getPiece()[i][1]]=black;
    }
  }
  public void printField(){
    for(int i = 0; i <10;i++){
      for(int j = 0; j<20;j++){
        print(field[i][j]);
      }
      println();
    }
  }
  public int checkForTetris(){
    int result = 0;
    for(int i = 0; i<20;i++){
      boolean allBlack = true;
      for(int j = 0; j<10;j++){
        if(field[j][i]==black){
          allBlack = false;
        }
      }
      if(allBlack==true){
        result = 1000;
        for(int h = 0;h<10;h++){
          field[h][i]=black;
        }
        for(int k=i;k>4;k--){
          for(int h = 0;h<10;h++){
            field[h][k]=field[h][k-1];
          }
        }
      }
    }
    return result;
  }
  public boolean gameOver(){
    erasePiece(temp);
    for(int h = 0;h<10;h++){
       if(field[h][4]!=black){
          return true;
       }
    }
    return false;
  }
                                    //draw methods
  public void drawField(){
    for (int i = 0; i < fieldWidth; i++){
      for (int j = 0; j< fieldHieght; j++){
         if(temp!=null){
           for(int h = 0; h<4; h++){
             field[temp.getX()+temp.getPiece()[h][0]][temp.getY()+temp.getPiece()[h][1]]=temp.getPieceColor();
           }
         }
        fill(field[i][j]);
        stroke(white);
        rect((float)i*brickWidth,(float)j*brickWidth,brickWidth,brickWidth);
      }
    }
  }
                                    //get methods
  public color[] getFieldRow(int x){
    return field[x];
  }
  public color getFieldXY(int x, int y){
    return field[x][y];
  }
  public boolean getResetPiece(){
    return resetPiece;
  }
  public void setResetPiece(boolean t){
    resetPiece = t;
  }
}
