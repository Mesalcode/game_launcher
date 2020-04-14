class FishRenderer implements Renderer{
  Fish toRender;
  FishRenderer(Fish toRender){  this.toRender = toRender;  }
  @Override
  void execute(){
    pushMatrix();
    api._translate(toRender.position);
    scale(toRender.orientation==FishOrientation.LEFT||toRender.orientation==FishOrientation.LEFT_DOWN||toRender.orientation==FishOrientation.LEFT_UP ? -1 : 1,1);
    rotate(toRender.orientation==FishOrientation.UP ? radians(-90) : (toRender.orientation==FishOrientation.DOWN ? radians(90) : radians(0)));
    api.imageCentered(toRender.settings.image,0,0);
    popMatrix();
  }
}
