class FishRenderer extends Renderer{
  Fish toRender;
  FishRenderer(Fish toRender){
    this.toRender = toRender;
  }
  @Override
  void execute(){
    image(toRender.settings.image,(int)toRender.positionX,(int)toRender.positionY);
  }
}
