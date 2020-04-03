class PlayerRestrictionsInfoSet{
  public float gravity;
  public int offsetY;
  public int[] movementFieldX;
 PlayerRestrictionsInfoSet(float gravity, int[] movementFieldX, int offsetY){
  this.gravity = gravity;
  this.offsetY = offsetY;
  this.movementFieldX = movementFieldX;
 }
}
