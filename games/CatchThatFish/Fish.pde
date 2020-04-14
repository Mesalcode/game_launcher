class Fish{
 MesalAPI.Position position;
 MesalAPI.Position targetPosition;
 FishOrientation orientation;
 FishSettings settings;
 Fish(FishSettings settings){
   this.settings = settings;
   position = new MesalAPI().new Position((int)random(0,gWorldBorderX),(int)random(800,gWorldBorderY));
 }
 private void renewTarget(){
   targetPosition = new MesalAPI().new Position(findNewTarget()[0],findNewTarget()[1]);
 }
 private FishOrientation selectOrientation(){
   return (oneDimensionalDist((int)position.x,(int)targetPosition.x)>=10 ? (targetPosition.x<position.x&targetPosition.y<position.y ? FishOrientation.LEFT_UP : (targetPosition.x<position.x&targetPosition.y>position.y ? orientation = FishOrientation.LEFT_DOWN : (targetPosition.x<position.x&targetPosition.y==position.y ? FishOrientation.LEFT : (targetPosition.x>position.x&targetPosition.y<position.y ? FishOrientation.RIGHT_UP : (targetPosition.x>position.x&targetPosition.y>position.y ? FishOrientation.RIGHT_DOWN: (targetPosition.x>position.x&targetPosition.y==position.y ? FishOrientation.RIGHT : FishOrientation.STANDBY)))))) : ((oneDimensionalDist((int)position.y,(int)targetPosition.y)>=10) ? (targetPosition.y>position.y ? FishOrientation.DOWN : FishOrientation.UP) : FishOrientation.STANDBY));
 }
 private boolean newTargetNeeded(){
   try {
     if (targetPosition.isResetted()) {return true;}}
   catch (NullPointerException notInitializedYet) {return true;}
   return false;
 }
 private void updateOrientationAndPosition(){
   orientation = selectOrientation();
   changePositionByOrientation();
 }
 private boolean hasReachedTarget(){
   return dist((float)position.x,(float)position.y,(float)targetPosition.x,(float)targetPosition.y)<50;
 }
 void move(){
  if (newTargetNeeded())
    renewTarget();
  else if (hasReachedTarget())
    targetPosition.resetCoordinates();
  else 
    updateOrientationAndPosition();
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
    move(orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_DOWN||orientation==FishOrientation.RIGHT_DOWN||orientation==FishOrientation.DOWN),orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_UP||orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.RIGHT_UP||orientation==FishOrientation.UP)),orientation==FishOrientation.STANDBY?false:(orientation==FishOrientation.LEFT_UP||orientation==FishOrientation.LEFT_DOWN||orientation==FishOrientation.LEFT),(orientation==FishOrientation.RIGHT_UP||orientation==FishOrientation.RIGHT_DOWN||orientation==FishOrientation.RIGHT));
 }
}
