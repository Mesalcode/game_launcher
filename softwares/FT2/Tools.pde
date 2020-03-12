class Tool {
  String name;
  String cursorPath = "Ressourcen/unavailable.png";
  String upsizedName = "Ressourcen/unavailable.png";
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
      image(loadImage("Zwischenablage/save"+String.valueOf(saveStatus-1)+".png"), 0, 0);
    }
    catch (Exception e) {
    }
    used = false;
  }
  void onFinish() {
    save("Zwischenablage/save" + saveStatus + ".png");
    if (saveStatus<delLimit) {
      saveStatus++;
    } else {
      saveStatus++;
      File toDelete = new File(sketchPath("Zwischenablage/save"+String.valueOf(delCount)+".png"));
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
    upsizedName="Ressourcen/pen_upscaled.png";
    cursorPath = "Ressourcen/pen.png";
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

      save("Zwischenablage/save" + saveStatus + ".png");
      if (saveStatus<delLimit) {
        saveStatus++;
      } else {
        saveStatus++;
        File toDelete = new File(sketchPath("Zwischenablage/save"+String.valueOf(delCount)+".png"));
        if (toDelete.exists())
          toDelete.delete();
        delCount++;
      }
    }
  }
  @Override
    void onSwitch() {
    drawState = 0;
    save("Zwischenablage/save" + saveStatus + ".png");
    if (saveStatus<delLimit) {
      saveStatus++;
    } else {
      saveStatus++;
      File toDelete = new File(sketchPath("Zwischenablage/save"+String.valueOf(delCount)+".png"));
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
    upsizedName="Ressourcen/line_upscaled.png";
    cursorPath = "Ressourcen/line.png";
  }
  @Override
    void use() {
    super.use();

    if (lineStatus>2) {
      image(loadImage("Zwischenablage/line_inprocess.png"), 0, 0);
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
        save("Zwischenablage/line_inprocess.png");
      used = true;
    }
    if (lineStatus>2) {
      image(loadImage("Zwischenablage/line_inprocess.png"), 0, 0);
      line(lineCoordinates[0], lineCoordinates[1], lineCoordinates[2], lineCoordinates[3]);
      lineStatus = 0;
      lineCoordinates=new int[4];
      super.onFinish();
    }
  }
  @Override
    void showPreview() {

    if (lineStatus==2) {


      image(loadImage("Zwischenablage/line_inprocess.png"), 0, 0);
      stroke(brushColorR, brushColorG, brushColorB, previewOpacity);
      line(lineCoordinates[0], lineCoordinates[1], mouseX, mouseY);
      point(mouseX, mouseY);
      stroke(brushColorR, brushColorG, brushColorB);
    }
    if (lineStatus==4)
      image(loadImage("Zwischenablage/line_inprocess.png"), 0, 0);
  }
  @Override
    void onSwitch() {

    super.onSwitch();
  }
}
class Triangle extends Tool {
  Triangle() {
    name="Dreieck";  
    cursorPath = "Ressourcen/triangle.png";
    upsizedName="Ressourcen/triangle_upscaled.png";
  }
  @Override
    void use() {
    super.use();
    if (triangleStatus>4) {
      image(loadImage("Zwischenablage/triangle_inprocess.png"), 0, 0);
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
        save("Zwischenablage/triangle_inprocess.png");
    }
    if (triangleStatus>4) {
      image(loadImage("Zwischenablage/triangle_inprocess.png"), 0, 0);
      triangle(triangleCoordinates[0], triangleCoordinates[1], triangleCoordinates[2], triangleCoordinates[3], triangleCoordinates[4], triangleCoordinates[5]);
      triangleStatus = 0;
      triangleCoordinates=new int[6];
      super.onFinish();
    }
  }
  @Override
    void showPreview() {

    if (triangleStatus==4) {


      image(loadImage("Zwischenablage/triangle_inprocess.png"), 0, 0);

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
      image(loadImage("Zwischenablage/triangle_inprocess.png"), 0, 0);
  }
  @Override
    void onSwitch() {

    super.onSwitch();
  }
}
class Rectangle extends Tool {
  Rectangle() {
    name="Viereck";      
    cursorPath = "Ressourcen/rectangle.png";
    upsizedName="Ressourcen/rectangle_upscaled.png";
  }
  @Override
    void use() {
    super.use();
    if (rectStatus>6) {
      image(loadImage("Zwischenablage/rectangle_inprocess.png"), 0, 0);
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
        save("Zwischenablage/rectangle_inprocess.png");
    }
    if (rectStatus>6) {
      image(loadImage("Zwischenablage/rectangle_inprocess.png"), 0, 0);
      quad(rectCoordinates[0], rectCoordinates[1], rectCoordinates[2], rectCoordinates[3], rectCoordinates[4], rectCoordinates[5], rectCoordinates[6], rectCoordinates[7]);
      rectStatus = 0;
      rectCoordinates=new int[8];
      super.onFinish();
    }
  }
  @Override
    void showPreview() {

    if (rectStatus==6) {


      image(loadImage("Zwischenablage/rectangle_inprocess.png"), 0, 0);

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
      image(loadImage("Zwischenablage/rectangle_inprocess.png"), 0, 0);
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
    cursorPath = "Ressourcen/circle.png";
    upsizedName="Ressourcen/circle_upscaled.png";
  }
  @Override
    void init() {
    save("Zwischenablage/save"+saveStatus+".png");
    saveStatus++;
  }
  @Override
    void use() {
    super.use();
   
    try {
      image(loadImage("Zwischenablage/save"+String.valueOf(saveStatus-1)+".png"), 0, 0);
    }
    catch (Exception e) {
    }
    circle(mouseX, mouseY, brushSize);
    super.onFinish();
    save("Zwischenablage/save"+saveStatus+".png");saveStatus++;
  }
  @Override
    void showPreview() {
    fill(brushColorR, brushColorG, brushColorB, previewOpacity);
    stroke(brushColorR, brushColorG, brushColorB, previewOpacity);
    try {
      image(loadImage("Zwischenablage/save"+String.valueOf(saveStatus-1)+".png"), 0, 0);
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
    cursorPath = "Ressourcen/pipette.png";
    upsizedName="Ressourcen/pipette_upscaled.png";
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
    cursorPath = "Ressourcen/bucket.png";
    upsizedName="Ressourcen/bucket_upscaled.png";
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
    upsizedName="Ressourcen/hand_upscaled.png";
    cursorPath = "Ressourcen/hand.png";
  }
}
