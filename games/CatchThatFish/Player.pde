class Player{
 MesalAPI.Position position;
 Bait bait;
 MesalAPI.Position restPosition;
 MesalAPI.Position positionStringEnd;
 Player(){
   position = api.new Position(gWorldBorderX/2,gLandScapeEndY+gBoatOffset);
   //bait = new Bait().noBait();
   bait = new Bait().smallBait();
   restPosition = api.new Position(position.x-playerImage.width/2,position.y-playerImage.height/2);
   positionStringEnd = restPosition;
 }
 boolean canSink(){
  return position.y+bait.speed<=bait.maxDepth;  
 }
 void lowerString(){
   if (canSink())
     positionStringEnd.changeCoordinatesBy(0,bait.speed);
 }
}
