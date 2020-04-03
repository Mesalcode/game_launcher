class ObstacleGenerator{
  int count = 0;
  int countLim = 85;
  Obstacle[] obstacles;
  float[] percentageTags; 
  ObstacleGenerator(Obstacle[] obstacles,float[] percentageTags){
    this.obstacles = obstacles;
    this.percentageTags = percentageTags;
    
  }
  void act(){
    if (count>=countLim){
      count=0;
      if (countLim>=35)
      countLim-=1;
      Obstacle template = obstacles[0];
      Position spawnPosition = new Position(new Random().nextInt(playerMovementFieldX[1]-playerMovementFieldX[0])+playerMovementFieldX[0],displayHeight-displayHeight/5,-10000);
      Obstacle toSpawn = new Obstacle(spawnPosition,template.scale,template.obstacleShape,template.rotates
      ,template.rotation0,template.rotation1,template.rotation2,template.rotation3,template.rollDelaySeconds,template.rollStart,template.movesSideways);
      callManager.addCall(new ObstacleCall(toSpawn));
    }else {
       count++;
    }
  }
} 
