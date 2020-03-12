GlobalVariables globalVarPool = new GlobalVariables();

ElementSeparator elementSeparator;
ShapeTools shapeTools;
ArrayTools arrayTools;
ObstacleTools obstacleTools;
CallTools callTools;
color gBackgroundColor;
String osTitle;
int[] playerMovementFieldX = new int[2];
float desiredFrameRate;
float obstacleSpeed;
int despawnBorderZ;
class GlobalVariables{
  void init(){
   elementSeparator = new ElementSeparator(); 
   shapeTools = new ShapeTools();
   arrayTools = new ArrayTools();
   obstacleTools = new ObstacleTools();
   callTools = new CallTools();
   //gBackgroundColor = 255;
   gBackgroundColor =   #8ae5ff;
   osTitle = "Don't Stop!";
   playerMovementFieldX[0] = displayWidth/8;
   playerMovementFieldX[1] = displayWidth-displayWidth/8;
   desiredFrameRate = 60.0;
   despawnBorderZ = displayHeight/3;
  }
  void initRuntimes(){
    obstacleSpeed = 16;
  }
}
