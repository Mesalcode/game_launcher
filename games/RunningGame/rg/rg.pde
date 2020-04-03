GameObjectThreadManager gameObjectThreadManager;
EnvironmentManager environmentManager;
ObstacleGenerator obstacleGenerator;
ObstacleRemover obstacleRemover;
CallManager callManager;
Player player;
Obstacle testObstacle;
PShape playerShape; 
PShape playerJumpShape;
PShape playerSlideShape;
PShape testObstacleShape;
void setup(){
 globalVarPool.init();
 globalVarPool.initRuntimes();
 frameRate(desiredFrameRate);
 surface.setTitle(osTitle);
 fullScreen(P3D);
 noCursor();
 playerShape = loadShape("justus.obj");
 playerJumpShape = loadShape("justus_jump.obj");
 playerSlideShape = loadShape("justus_slide.obj");
testObstacleShape = loadShape("Barrel.obj");
 shapeTools.headToFeet(testObstacleShape);
 shapeTools.rightAngleTurn(testObstacleShape);
 shapeTools.headToFeet(playerShape);
 shapeTools.headToFeet(playerJumpShape);
 shapeTools.headToFeet(playerSlideShape);
 
 float playerGravity = 0.1f;
 Position playerStartPosition = new Position(displayWidth/2,displayHeight-displayHeight/5,-30);
 PlayerShapesSet playerShapes = new PlayerShapesSet(playerShape,playerJumpShape,playerSlideShape);
 float playerScale = displayHeight/5.8;
 int playerPossibleSpeedX = displayWidth/(displayWidth/6);
 float playerJumpHeightY = -(displayHeight/(displayHeight/6));
 int playerOffsetY = (int)(displayHeight*0.000);
 int playerSlideDuration = (int)(frameRate*2);
 PlayerShapeInfoSet playerShapeInfo = new PlayerShapeInfoSet(playerShapes, playerScale);
 PlayerRestrictionsInfoSet playerRestrictions = new PlayerRestrictionsInfoSet(playerGravity,playerMovementFieldX, playerOffsetY);
 PlayerStrengthInfoSet playerStrength = new PlayerStrengthInfoSet(playerPossibleSpeedX, playerJumpHeightY, playerSlideDuration);
 PlayerBehaviorInfoSet playerBehavior = new PlayerBehaviorInfoSet(playerRestrictions,playerStrength);
 PlayerInfoContainer playerInformationContainer = new PlayerInfoContainer(playerStartPosition,playerShapeInfo,playerBehavior);
 player = new Player(playerInformationContainer);
 
 Position testObstacleStartPosition = new Position(displayWidth/2,displayHeight-displayHeight/5,-1000);
 testObstacle = new Obstacle(testObstacleStartPosition,displayHeight/5.8,testObstacleShape,true,PI,0,0,1,0.15*(60/frameRate),0,false);
 callManager = new CallManager();
 callManager.addCall(new PlayerCall(player));
 callManager.addCall(new ObstacleCall(testObstacle));
 gameObjectThreadManager = new GameObjectThreadManager(callManager.getCalls());
 environmentManager = new EnvironmentManager(gBackgroundColor);
 Obstacle[] availables = {testObstacle};
 float[] percentages = {0.1};
 obstacleGenerator = new ObstacleGenerator(availables,percentages);
 obstacleRemover = new ObstacleRemover(); 
 noStroke();
 smooth();
}
void draw(){
  gameObjectThreadManager.setCalls(callManager.getCalls());
  environmentManager.build();
  gameObjectThreadManager.executeAll();
  obstacleGenerator.act();
  if (callManager.getCalls().length>1){
    ObstacleCall[] oCalls = {(ObstacleCall)callManager.getCalls()[1]};
    obstacleRemover.act(obstacleTools.buildListFromCalls(oCalls));
  }
}
void keyPressed(){
 if (key==' ') 
   player.jump();
 if (keyCode==SHIFT)
   player.slide();

}
