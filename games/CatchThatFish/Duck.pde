class Duck{
  MesalAPI.Position position;
  MesalAPI.Position targetPosition;
  Duck(){
   position = randomPosition();
   renewTarget();
  }
  void act(){
    if (reachedTarget())
      move(targetPosition.x > position.x ? true : false);
    else
      renewTarget();
  }
  MesalAPI.Position randomPosition(){
    return api. new Position((double)gLandScapeEndY,(double)random(-100,gWorldBorderX+100));
  }
  private void renewTarget(){
    targetPosition = randomPosition();
  }
  private boolean reachedTarget(){
   return api.oneDimensionalDist((int)targetPosition.x,(int)position.x)>15;
  }
  private void move(boolean left){
   position.changeCoordinatesBy(left ? -10 : 10,0.0);
 }
}
