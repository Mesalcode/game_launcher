class Player{
 MesalAPI.Position position;
 Bait bait;
 Rod rod;
 MesalAPI.Position restPosition;
 MesalAPI.Position positionStringEnd;
 Player(){
   position = api.new Position(gWorldBorderX/2,gLandScapeEndY+gBoatOffset);
   //bait = new Bait().noBait();
   bait = new Bait().smallBait();
   //bait = new Bait().bigBait();
   rod = new Rod().shallowRod();
   restPosition = api.new Position(position.x-playerImage.width/2,position.y-playerImage.height/2);
   positionStringEnd = restPosition;
 }
 boolean canSink(){
  return positionStringEnd.y+bait.speed<=rod.maxDepth;  
 }
 void lowerString(){
   if (canSink())
     positionStringEnd.changeCoordinatesBy(0,bait.speed);
 }
}
