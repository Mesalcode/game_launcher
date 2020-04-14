class WaterRenderer implements Renderer{
 int originX,originY,_width,depth;
 int[] waterColor;
 PImage image;
 WaterRenderer(int originX, int originY, int _width, int depth, PImage image){
   this.originX = originX;
   this.originY = originY;
   this._width = _width;
   this.depth = depth;
   this.image = image;
 }
 void execute(){
   render();
 }
 private void render(){
   image(image,0,0);
 }
}
