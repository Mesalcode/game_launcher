class Obstacle{
  int posX, posY, posZ;
  float scale;
  PShape obstacleShape;
  boolean rotates;
  float rotation0;
  int rotation1,rotation2,rotation3;
  float rollPosition;
  float rollDelaySeconds;
  float rollStart;
  boolean movesSideways;
  Obstacle(int startX,int startY,int startZ,float scale, PShape obstacleShape, boolean doesRotate, float rotation0, int rotation1, int rotation2, int rotation3, float rollDelaySeconds, float rollStart, boolean movesSideways){
    posX = startX;
    posY = startY;
    posZ = startZ;
    this.scale = scale;
    this.obstacleShape = obstacleShape;
    rotates = doesRotate;
    this.rotation0 = rotation0;
    this.rotation1 = rotation1;
    this.rotation2 = rotation2;
    this.rotation3 = rotation3;
    this.rollStart = rollStart;
    this.rollDelaySeconds = rollDelaySeconds;
    rollPosition = rollStart<=rollDelaySeconds ? rollStart : 0;
    this.movesSideways = movesSideways;
  }
  void animate(){
    translate(posX,posY,posZ);
    scale(100);
    shape(obstacleShape,0,0);
    if (rotates)
      applyRotation();
  }
  void applyRotation(){
    if (rollPosition>=rollDelaySeconds){
      rollPosition=0;
      obstacleShape.rotate(rotation0,rotation1,rotation2,rotation3);
    }else {
     rollPosition+=1/frameRate; 
    }
  }
  void move(){
    if (!movesSideways)
    posZ+=obstacleSpeed;
    else {
      
      
    }
  }
}
