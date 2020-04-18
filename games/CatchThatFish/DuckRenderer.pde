class DuckRenderer implements Renderer{
  Duck toRender;
  DuckRenderer(Duck toRender){
    this.toRender = toRender;
  }
  void execute(){
    pushMatrix();
    api._translate(toRender.position);
    scale(toRender.targetPosition.x>toRender.position.x ? 1 : -1, 1);
    api.imageCentered(duckImage,0,0);
    popMatrix();
  }
}
