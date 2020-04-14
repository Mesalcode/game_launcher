class Camera{
  MesalAPI.Position position;
  Camera(MesalAPI.Position position){
    this.position = position;
  }
  void arrange(){ 
    api._camera(position);
  }
  void moveY(int by){
    position.changeCoordinatesBy(0.0,position.y+displayHeight/2+by<=gWorldBorderY&position.y-displayHeight/2+by>=0 ? by : 0);
  }
}
