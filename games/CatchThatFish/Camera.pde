class Camera{
  Position position;
  Camera(Position position){
    this.position = position;
  }
  void arrange(){
     camera((float)position.x, (float)position.y, (displayHeight / 2) / tan(PI*30.0 / 180.0), (float)position.x, (float)position.y, 0, 0, 1, 0);
  }
  void moveY(int by){
    if (position.y+displayHeight/2+by<=gWorldBorderY&position.y-displayHeight/2+by>=0)
      position.y += by;
  }
}
