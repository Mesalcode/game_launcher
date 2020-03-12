class EnvironmentManager{
  color backgroundColor;
  EnvironmentManager(color backgroundColor){
    this.backgroundColor = backgroundColor;
  }
  void build(){
    /*camera(width/2.0, height/3.5, (height/2.0)/tan(PI*30.0/180.0),
    width/2.0, height/2.0, 0,
    0, 1, 0); */
    background(backgroundColor);
    lights();
    fill(#f3b48b);
    elementSeparator.sectionStart();
    translate(width/2, height, 0);
    //rotateX(-PI/6); 
    //rotateY(PI/3); 
    //box(playerMovementFieldX[1]-playerMovementFieldX[0],160,300); 
    box(displayWidth,160,displayHeight*40); 
    elementSeparator.sectionEnd();
  }
}
