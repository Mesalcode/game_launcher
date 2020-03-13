class Tool {
  String name;
  String cursorPath = "res/unavailable.png";
  String upsizedName = "res/unavailable.png";
  boolean used = false;
  void use() {
    used=true;
  }
  PImage getCursor() {
    return loadImage(sketchPath(cursorPath));
  }
  void activate() {
  }
  void showPreview() {
  }
  void init() {
  }
  void onSwitch() {
    try {
      image(loadImage("cache/save"+String.valueOf(saveStatus-1)+".png"), 0, 0);
    }
    catch (Exception e) {
    }
    used = false;
  }
  void onFinish() {
    save("cache/save" + saveStatus + ".png");
    if (saveStatus<delLimit) {
      saveStatus++;
    } else {
      saveStatus++;
      File toDelete = new File(sketchPath("cache/save"+String.valueOf(delCount)+".png"));
      if (toDelete.exists())
        toDelete.delete();
      delCount++;
    }
  }

  public boolean dragable = false;
}

class Pen extends Tool {
  Pen() {
    dragable = true; 
    name="Stift";  
    upsizedName="res/pen_upscaled.png";
    cursorPath = "res/pen.png";
  }
  @Override
    void use() {

    point(mouseX, mouseY);
    onFinish();
  }
  @Override
    void onFinish() {
    if (drawState<drawSaveDelay) {
      drawState++;
    } else {
      drawState = 0;

      save("cache/save" + saveStatus + ".png");
      if (saveStatus<delLimit) {
        saveStatus++;
      } else {
        saveStatus++;
        File toDelete = new File(sketchPath("cache/save"+String.valueOf(delCount)+".png"));
        if (toDelete.exists())
          toDelete.delete();
        delCount++;
      }
    }
  }
  @Override
    void onSwitch() {
    drawState = 0;
    save("cache/save" + saveStatus + ".png");
    if (saveStatus<delLimit) {
      saveStatus++;
    } else {
      saveStatus++;
      File toDelete = new File(sketchPath("cache/save"+String.valueOf(delCount)+".png"));
      if (toDelete.exists())
        toDelete.delete();
      delCount++;
    }
    super.onSwitch();
  }
}
class Line extends Tool {
  boolean first = true;
  Line() {
    name="Linie";   
    upsizedName="res/line_upscaled.png";
    cursorPath = "res/line.png";
  }
  @Override
    void use() {
    super.use();

    if (lineStatus>2) {
      image(loadImage("cache/line_inprocess.png"), 0, 0);
      line(lineCoordinates[0], lineCoordinates[1], lineCoordinates[2], lineCoordinates[3]);
      lineStatus = 0;
      lineCoordinates=new int[4];
    } else {
      lineCoordinates[lineStatus] = mouseX;
      lineStatus++;
      lineCoordinates[lineStatus] = mouseY;
      lineStatus++;


      point(mouseX, mouseY);
      if (lineStatus==2)
        save("cache/line_inprocess.png");
      used = true;
    }
    if (lineStatus>2) {
      image(loadImage("cache/line_inprocess.png"), 0, 0);
      line(lineCoordinates[0], lineCoordinates[1], lineCoordinates[2], lineCoordinates[3]);
      lineStatus = 0;
      lineCoordinates=new int[4];
      super.onFinish();
    }
  }
  @Override
    void showPreview() {

    if (lineStatus==2) {


      image(loadImage("cache/line_inprocess.png"), 0, 0);
      stroke(brushColorR, brushColorG, brushColorB, previewOpacity);
      line(lineCoordinates[0], lineCoordinates[1], mouseX, mouseY);
      point(mouseX, mouseY);
      stroke(brushColorR, brushColorG, brushColorB);
    }
    if (lineStatus==4)
      image(loadImage("cache/line_inprocess.png"), 0, 0);
  }
  @Override
    void onSwitch() {

    super.onSwitch();
  }
}
class Triangle extends Tool {
  Triangle() {
    name="Dreieck";  
    cursorPath = "res/triangle.png";
    upsizedName="res/triangle_upscaled.png";
  }
  @Override
    void use() {
    super.use();
    if (triangleStatus>4) {
      image(loadImage("cache/triangle_inprocess.png"), 0, 0);
      triangle(triangleCoordinates[0], triangleCoordinates[1], triangleCoordinates[2], triangleCoordinates[3], triangleCoordinates[4], triangleCoordinates[5]);
      triangleStatus = 0;
      triangleCoordinates=new int[6];
    } else {
      triangleCoordinates[triangleStatus] = mouseX;
      triangleStatus++;
      triangleCoordinates[triangleStatus] = mouseY;
      triangleStatus++;

      point(mouseX, mouseY);
      if (triangleStatus==4)
        save("cache/triangle_inprocess.png");
    }
    if (triangleStatus>4) {
      image(loadImage("cache/triangle_inprocess.png"), 0, 0);
      triangle(triangleCoordinates[0], triangleCoordinates[1], triangleCoordinates[2], triangleCoordinates[3], triangleCoordinates[4], triangleCoordinates[5]);
      triangleStatus = 0;
      triangleCoordinates=new int[6];
      super.onFinish();
    }
  }
  @Override
    void showPreview() {

    if (triangleStatus==4) {


      image(loadImage("cache/triangle_inprocess.png"), 0, 0);

      fill(brushColorR, brushColorG, brushColorB, previewOpacity);
      stroke(brushColorR, brushColorG, brushColorB, previewOpacity);
      triangle(triangleCoordinates[0], triangleCoordinates[1], triangleCoordinates[2], triangleCoordinates[3], mouseX, mouseY);
      point(mouseX, mouseY);
      if (filled)
        fill(brushColorR, brushColorG, brushColorB);
      else 
      fill(0, 0);
      stroke(brushColorR, brushColorG, brushColorB);
    }
    if (triangleStatus==6)
      image(loadImage("cache/triangle_inprocess.png"), 0, 0);
  }
  @Override
    void onSwitch() {

    super.onSwitch();
  }
}
class Rectangle extends Tool {
  Rectangle() {
    name="Viereck";      
    cursorPath = "res/rectangle.png";
    upsizedName="res/rectangle_upscaled.png";
  }
  @Override
    void use() {
    super.use();
    if (rectStatus>6) {
      image(loadImage("cache/rectangle_inprocess.png"), 0, 0);
      quad(rectCoordinates[0], rectCoordinates[1], rectCoordinates[2], rectCoordinates[3], rectCoordinates[4], rectCoordinates[5], rectCoordinates[6], rectCoordinates[7]);

      rectStatus = 0;
      rectCoordinates=new int[48];
    } else {
      rectCoordinates[rectStatus] = mouseX;
      rectStatus++;
      rectCoordinates[rectStatus] = mouseY;
      rectStatus++;

      point(mouseX, mouseY);
      if (rectStatus==6)
        save("cache/rectangle_inprocess.png");
    }
    if (rectStatus>6) {
      image(loadImage("cache/rectangle_inprocess.png"), 0, 0);
      quad(rectCoordinates[0], rectCoordinates[1], rectCoordinates[2], rectCoordinates[3], rectCoordinates[4], rectCoordinates[5], rectCoordinates[6], rectCoordinates[7]);
      rectStatus = 0;
      rectCoordinates=new int[8];
      super.onFinish();
    }
  }
  @Override
    void showPreview() {

    if (rectStatus==6) {


      image(loadImage("cache/rectangle_inprocess.png"), 0, 0);

      fill(brushColorR, brushColorG, brushColorB, previewOpacity);
      stroke(brushColorR, brushColorG, brushColorB, previewOpacity);
      quad(rectCoordinates[0], rectCoordinates[1], rectCoordinates[2], rectCoordinates[3], rectCoordinates[4], rectCoordinates[5], mouseX, mouseY);
      point(mouseX, mouseY);
      if (filled)
        fill(brushColorR, brushColorG, brushColorB);
      else 
      fill(0, 0);
      stroke(brushColorR, brushColorG, brushColorB);
    }
    if (rectStatus==8)
      image(loadImage("cache/rectangle_inprocess.png"), 0, 0);
  }
  @Override
    void onSwitch() {

    super.onSwitch();
  }
}
class Circle extends Tool {
  boolean first = true;
  Circle() {
    name="Kreis";     
    cursorPath = "res/circle.png";
    upsizedName="res/circle_upscaled.png";
  }
  @Override
    void init() {
    save("cache/save"+saveStatus+".png");
    saveStatus++;
  }
  @Override
    void use() {
    super.use();
   
    try {
      image(loadImage("cache/save"+String.valueOf(saveStatus-1)+".png"), 0, 0);
    }
    catch (Exception e) {
    }
    circle(mouseX, mouseY, brushSize);
    super.onFinish();
    save("cache/save"+saveStatus+".png");saveStatus++;
  }
  @Override
    void showPreview() {
    fill(brushColorR, brushColorG, brushColorB, previewOpacity);
    stroke(brushColorR, brushColorG, brushColorB, previewOpacity);
    try {
      image(loadImage("cache/save"+String.valueOf(saveStatus-1)+".png"), 0, 0);
    }
    catch (Exception e) {
    }
    circle(mouseX, mouseY, brushSize);

    if (filled)
      fill(brushColorR, brushColorG, brushColorB);
    else 
    fill(0, 0);

    stroke(brushColorR, brushColorG, brushColorB);
  }
  @Override
    void onSwitch() {

    super.onSwitch();
  }
}
class Pipette extends Tool {
  Pipette() {
    name="Pipette";      
    cursorPath = "res/pipette.png";
    upsizedName="res/pipette_upscaled.png";
  }
  @Override
    void use() {
    color touchedColor = get(mouseX, mouseY) ;
    setBrushColor((int)red(touchedColor), (int)green(touchedColor), (int)blue(touchedColor));
  }
}
class Bucket extends Tool {
  Bucket() {
    name="Farbeimer";    
    cursorPath = "res/bucket.png";
    upsizedName="res/bucket_upscaled.png";
  }
  @Override
    void use() {
    //background(brushColorR,brushColorG,brushColorB);

    loadPixels();
    FF f = new FF();
    f.DoFill(mouseX, mouseY, color(brushColorR, brushColorG, brushColorB));
    updatePixels();
    super.onFinish();
  }
}

class Hand extends Tool {
  Hand() {
    name="Hand";  
    upsizedName="res/hand_upscaled.png";
    cursorPath = "res/hand.png";
  }
}
