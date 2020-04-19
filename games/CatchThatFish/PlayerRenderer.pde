class PlayerRenderer implements Renderer{
  Player toRender;
  PlayerRenderer(Player toRender){
    this.toRender = toRender;
  }
  void execute(){
   api.imageCentered(playerImage,(int)toRender.position.x,(int)toRender.position.y); 
   api.imageCentered(toRender.bait.image,(int)toRender.position.x,(int)toRender.position.y);
  }
}
