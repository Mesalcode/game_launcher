class DuckRenderer implements Renderer{
  Duck toRender;
  DuckRenderer(Duck toRender){
    this.toRender = toRender;
  }
  void execute(){
    api.imageCentered(duckImage,(int)toRender.position.x,(int)toRender.position.y);
  }
}
