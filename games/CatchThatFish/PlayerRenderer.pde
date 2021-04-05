class PlayerRenderer implements Renderer{
  Player toRender;
  PlayerRenderer(Player toRender){
    this.toRender = toRender;
  }
  void execute(){
   api.imageCentered(playerImage,toRender.position); 
   api._line(toRender.restPosition,toRender.positionStringEnd);
   api.imageCentered(toRender.bait.image,(int)toRender.positionStringEnd.x,(int)(toRender.positionStringEnd.y+toRender.bait.image.height/4));
   camera.assignCenter(api.new Position(displayWidth/2,toRender.positionStringEnd.y));
   if (DEBUG_SHOW_STRENGTH_INDICATORS){
     text("Stärke: " + toRender.bait.minStrength + "-" + toRender.bait.maxStrength, (float) toRender.positionStringEnd.x + (float) (toRender.bait.image.width / 2) + 20f, (float) toRender.positionStringEnd.y+ (toRender.bait.image.height / 2) + toRender.bait.image.height/4f);
   }  
}
}
