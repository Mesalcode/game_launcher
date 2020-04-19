class Player{
 MesalAPI.Position position;
 Bait bait;
 MesalAPI.Position positionStringEnd;
 Player(){
   position = api.new Position(gWorldBorderX/2,gLandScapeEndY+gBoatOffset);
   //bait = new Bait().noBait();
   bait = new Bait().smallBait();
   
 }
}
