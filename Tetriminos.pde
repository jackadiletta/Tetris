// Class definition for the game pieces, geometrically known as tetriminos

class Tetrimino {
  private int[][] piece;
  private color pieceColor;
  private int type;
  private int[] coordinates = {0,0};
  
  public Tetrimino(int type1){
    piece = new int[4][2];
    pieceColor = colors[(int)random(6)];
    type = type1;
    piece = getTetriminoConjugation(type);
  }
  
 
                                      //get methods
  public int[][] getPiece(){
    return piece;
  }
  public int getX(){
    return coordinates[0];
  }
  public int getY(){
    return coordinates[1];
  }
  public color getPieceColor(){
    return pieceColor;
  }
  public void printPiece(){
    for(int i = 0; i <4;i++){
      for(int j = 0; j<2;j++){
        print(piece[i][j] + coordinates[j] +", ");
      }
      println();
    }
  }
  public void setPiece(int[][] newSet){
    piece = newSet;
  }
  public int getType(){
    return type;
  }
  public void incrementType(){
    type++;
  }
  public void decrementType(){
    type--;
  }
  public void setType(int t){
    type = t;
  }
  public int[][] getTetriminoConjugation(int tetrimino){
          int[][][] TetriminoConjugations= {{{1,0},{1,1},{1,2},{1,3}},
                                            {{0,1},{1,1},{2,1},{3,1}},
                                            {{2,0},{2,1},{2,2},{2,3}},
                                            {{0,2},{1,2},{2,2},{3,2}},
                                            
                                            {{0,1},{1,1},{1,2},{2,2}},
                                            {{1,1},{1,2},{2,0},{2,1}},
                                            {{1,1},{2,1},{2,2},{3,2}},
                                            {{1,2},{1,3},{2,1},{2,2}},
                                            
                                            {{1,0},{1,1},{1,2},{2,2}},
                                            {{1,1},{1,2},{2,1},{3,1}},
                                            {{1,1},{2,1},{2,2},{2,3}},
                                            {{0,2},{1,2},{2,1},{2,2}},
                                            
                                            {{1,1},{1,2},{2,2},{2,3}},
                                            {{0,2},{1,2},{1,1},{2,1}},
                                            {{1,0},{1,1},{2,1},{2,2}},
                                            {{1,2},{2,2},{2,1},{3,1}},
                                            
                                            {{1,1},{1,2},{2,2},{3,2}},
                                            {{1,1},{1,2},{1,3},{2,1}},
                                            {{0,1},{1,1},{2,1},{2,2}},
                                            {{1,2},{2,2},{2,1},{2,0}},
                                            
                                            {{0,1},{1,0},{1,1},{2,1}},
                                            {{1,0},{1,2},{1,1},{2,1}},
                                            {{0,1},{1,2},{1,1},{2,1}},
                                            {{0,1},{1,0},{1,2},{1,1}},
                                            
                                            {{1,1},{1,2},{2,1},{2,2}},
                                             };
   return TetriminoConjugations[tetrimino];
  }
  
  public void setCoordinates(int x, int y){
    coordinates[0]=x;
    coordinates[1]=y;
  }
  public void addToCoordinates(int x, int y){
    coordinates[0]+=x;
    coordinates[1]+=y;
  }
}
