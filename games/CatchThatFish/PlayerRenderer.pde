class PlayerRenderer implements Renderer{
  Player toRender;
  PlayerRenderer(Player toRender){
    this.toRender = toRender;
  }
  void execute(){
   api.imageCentered(playerImage,(int)toRender.position.x,(int)toRender.position.y); 
  }
}
