class WaterRenderer extends Renderer{
 int originX,originY,_width,depth;
 int[] waterColor;
 WaterRenderer(int originX, int originY, int _width, int depth, int[] waterColor){
   this.originX = originX;
   this.originY = originY;
   this._width = _width;
   this.depth = depth;
   this.waterColor = waterColor;
 }
 void execute(){
   super.adjustingFill(waterColor);
   render();
 }
 private void render(){
   noStroke();
   rect(originX,originY,_width-originX,depth-originY);
 }
}
