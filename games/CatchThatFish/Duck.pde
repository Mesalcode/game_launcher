class Duck{
  MesalAPI.Position position;
  MesalAPI.Position targetPosition;
  Duck(){
   position = randomPosition();
   renewTarget();
  }
  void act(){
    if (!reachedTarget())
      move(targetPosition.x > position.x ? false : true);
    else
      renewTarget();
  }
  MesalAPI.Position randomPosition(){
    return api.new Position((double)random(0,gWorldBorderX),(double)gLandScapeEndY+gDuckOffset);
  }
  private void renewTarget(){
    targetPosition = randomPosition();
  }
  private boolean reachedTarget(){
   return api.oneDimensionalDist((int)targetPosition.x,(int)position.x)<30;
  }
  private void move(boolean left){
   position.changeCoordinatesBy(left ? -1 : 1,0.0);
 }
}
