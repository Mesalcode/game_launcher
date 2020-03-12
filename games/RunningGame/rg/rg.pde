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
 player = new Player(displayWidth/2,displayHeight-displayHeight/5,-30,displayHeight/5.8,playerShape,playerJumpShape,playerSlideShape,playerGravity,displayWidth/(displayWidth/6),-(displayHeight/(displayHeight/6)),(int)(frameRate*2), playerMovementFieldX,(int)(displayHeight*0.000));
 testObstacle = new Obstacle(displayWidth/2,displayHeight-displayHeight/5,-1000,displayHeight/5.8,testObstacleShape,true,PI,0,0,1,0.15*(60/frameRate),0,false);
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
