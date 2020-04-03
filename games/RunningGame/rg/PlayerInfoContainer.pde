class PlayerInfoContainer{
 Position startPosition;
 float scale;
 PShape runShape, jumpShape, slideShape;
 float gravity;
 int possibleSpeedX,slideDuration,offsetY;
 float jumpHeightY;
 int[] movementFieldX;
 PlayerInfoContainer(Position startPosition, PlayerShapeInfoSet shapeInformation, PlayerBehaviorInfoSet behaviorInformation){
   this.startPosition = startPosition;
   scale = shapeInformation.shapeScale;
   runShape = shapeInformation.runShape;
   jumpShape = shapeInformation.jumpShape;
   slideShape = shapeInformation.slideShape;
   gravity = behaviorInformation.restrictionsInformation.gravity;
   movementFieldX = behaviorInformation.restrictionsInformation.movementFieldX;
   offsetY = behaviorInformation.restrictionsInformation.offsetY;
   possibleSpeedX = behaviorInformation.strengthInformation.possibleSpeedX;
   slideDuration = behaviorInformation.strengthInformation.slideDuration;
   jumpHeightY = behaviorInformation.strengthInformation.jumpHeightY;
 }
}
