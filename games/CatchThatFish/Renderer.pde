class Renderer{
  void execute(){
    
  }
  void adjustingFill(int[] fillColor){
   switch (fillColor.length){
     case 1:
       fill(fillColor[0]);
       break;
     case 2:
       fill(fillColor[1]);
       break;
     case 3:
       fill(fillColor[0],fillColor[1],fillColor[2]);
       break;
     case 4:
       fill(fillColor[0],fillColor[1],fillColor[2],fillColor[3]);
       break;
   }
  }
}
