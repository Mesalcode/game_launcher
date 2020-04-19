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
  }
}
