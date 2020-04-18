class PlayerRenderer implements Renderer{
  Player toRender;
  PlayerRenderer(Player toRender){
    this.toRender = toRender;
  }
  void execute(){
   api.imageCentered(boatImage,(int)toRender.position.x,(int)toRender.position.y); 
  }
}
