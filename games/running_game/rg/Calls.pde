interface Call{
 void exec();
 
}
class DeadCall implements Call{
  @Override
  void exec(){}
}
class ObstacleCall implements Call{
 private Obstacle reference;
 ObstacleCall(Obstacle referenceObstacle){
   reference = referenceObstacle;
 }
 @Override
 void exec(){
   reference.animate();
   reference.move();
 }
 Obstacle getReference(){
   return reference;
 }
}
class PlayerCall implements Call{
 private Player reference;
 PlayerCall(Player referencePlayer){
  reference = referencePlayer; 
 }
 @Override
 void exec(){
  reference.checkCollision();
  reference.calculateGravity();
  reference.animate();
  if (keyPressed){
    if (key=='a')
     reference.goLeft();
   if (key=='d')
     reference.goRight(); 
  }
 }
}
