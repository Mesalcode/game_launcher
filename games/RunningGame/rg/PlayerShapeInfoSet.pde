class PlayerShapeInfoSet{
 public PShape runShape,jumpShape,slideShape;
 public float shapeScale;
 PlayerShapeInfoSet(PlayerShapesSet shapes, float shapeScale){
   this.runShape = shapes.runShape;
   this.jumpShape = shapes.jumpShape;
   this.slideShape = shapes.slideShape;
   this.shapeScale = shapeScale;
 }
}
