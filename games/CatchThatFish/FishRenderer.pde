class FishRenderer implements Renderer{
  Fish toRender;
  FishRenderer(Fish toRender){
    this.toRender = toRender;
  }
  @Override
  void execute(){
    PImage fishImage = toRender.settings.image;
    pushMatrix();
    translate((float)toRender.position.x,(float)toRender.position.y);
    switch (toRender.orientation){
     case LEFT:
       scale(-1,1);
       break;
     case LEFT_DOWN:
       scale(-1,1);
       break;
     case LEFT_UP:
       scale(-1,1);
       break;
     case UP:
      rotate(radians(-90));
      break;
     case DOWN:
      rotate(radians(90));
      break;
     default:
      break;
    } 
    imageMode(CENTER);
    image(fishImage,0,0);
    imageMode(CORNER);
    popMatrix();
  }
}
