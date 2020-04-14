class Fish{
 Position position;
 Position targetPosition;
 FishOrientation orientation;
 FishSettings settings;
 Fish(FishSettings settings){
   this.settings = settings;
   position = new Position((int)random(0,gWorldBorderX),(int)random(800,gWorldBorderY));
   orientation = FishOrientation.STANDBY;
 }
 private void renewTarget(){
   int[] newTargetCoordinates = findNewTarget();
   targetPosition = new Position(newTargetCoordinates[0],newTargetCoordinates[1]);
 }
 void move(){
  try {
    if (targetPosition.x==0&targetPosition.y==0){
     renewTarget();
    }
  }catch (NullPointerException nullPointerException){
    renewTarget();
  }
  if (dist((float)position.x,(float)position.y,(float)targetPosition.x,(float)targetPosition.y)<50){
    targetPosition.x = 0;
    targetPosition.y = 0;
  }else {
    if (oneDimensionalDist((int)position.x,(int)targetPosition.x)>=10){
      if (targetPosition.x<position.x&targetPosition.y<position.y)
       orientation = FishOrientation.LEFT_UP;
      else if (targetPosition.x<position.x&targetPosition.y>position.y)
        orientation = FishOrientation.LEFT_DOWN;
      else if (targetPosition.x<position.x&targetPosition.y==position.y)
        orientation = FishOrientation.LEFT;
      else if (targetPosition.x>position.x&targetPosition.y<position.y)
       orientation = FishOrientation.RIGHT_UP;
      else if (targetPosition.x>position.x&targetPosition.y>position.y)
        orientation = FishOrientation.RIGHT;
      else if (targetPosition.x>position.x&targetPosition.y==position.y)
        orientation = FishOrientation.RIGHT;
    }else if (oneDimensionalDist((int)position.y,(int)targetPosition.y)>=10){
     if(targetPosition.y>position.y)
       orientation = FishOrientation.DOWN;
     else
       orientation = FishOrientation.UP;
    }else {
       orientation = FishOrientation.STANDBY; 
    }
    changePositionByOrientation();
  }
 }
 private int oneDimensionalDist(int pos1, int pos2){
  return pos2-pos1 >= 0 ? pos2-pos1 : -(pos2-pos1);
 }
 private int[] findNewTarget(){
  return new int[]{(int)random(0,2000-1)+1,(int)random(800,7500-1)+1};
 }
 private void move(boolean down, boolean up, boolean left, boolean right){;
   position.changeCoordinatesBy((double)(left ? -settings.abilityData.speed : (right ? settings.abilityData.speed : 0)), (up ? -settings.abilityData.speed : (down ? settings.abilityData.speed : 0)));
 }
 private void changePositionByOrientation(){
  switch (orientation){
   case LEFT_UP:
     move(false,true,true,false);
     break;
   case LEFT_DOWN:
     move(true,false,true,false);
     break;
   case LEFT:
     move(false,false,true,false);
     break;
   case RIGHT_UP:
     move(false,true,false,true);
     break;
   case RIGHT_DOWN:
     move(true,false,false,true);
     break;
   case RIGHT:
     move(false,false,false,true);
     break;
   case UP:
     move(false,true,false,false);
     break;
   case DOWN:
     move(true,false,false,false);
     break;
   case STANDBY:
     break;
  }
 }
}
