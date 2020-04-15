/*
MIT License

Copyright (c) 2020 Alexander Mertens

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
WaterRenderer waterRenderer;
Camera camera;
MesalAPI api;
ArrayList<FishSettings> fishSettings;
ArrayList<Renderer> renderers;
ArrayList<Fish> fishs;
int gWorldBorderX,gWorldBorderY;
float gSizeMultiplicator;
PImage backgroundImage;
void setup(){
 frameRate(60);
 fullScreen(P3D);
 initializeGlobalVariables();
 initializeRenderers();
 camera = new Camera(new MesalAPI().new Position(displayWidth/2,displayHeight/2));
}
private void initializeGlobalVariables(){
 gSizeMultiplicator = 0.15;
 renderers = new ArrayList<Renderer>();
 fishs = new ArrayList<Fish>();
 fishSettings = loadFishSettings();
 backgroundImage = loadImage("background.png");
 gWorldBorderX = backgroundImage.width;
 gWorldBorderY = backgroundImage.height;
 api = new MesalAPI();
}
private void initializeRenderers(){
 renderers.add(new WaterRenderer(0,600,20000,5000,backgroundImage)); 
 for (FishSettings f : fishSettings){
   Fish toAdd = new Fish(f);
   fishs.add(toAdd);
   renderers.add(new FishRenderer(toAdd));
 }
}
void draw(){
 background(255);
 for (Renderer r : renderers)
  r.execute(); 
 for (Fish f : fishs)
   f.move();
 camera.arrange();
 
 //---Tests---
 if (keyPressed)
   testMoveAroundFreelyWithArrowKeys(keyCode); 
}
private String[] loadMetaData(String metaName){
  String[] metaData = loadStrings("META/"+metaName+".meta");
  for (int i = 0; i < metaData.length;i++)
    metaData[i] = metaData[i].substring(metaData[i].indexOf(",")+1);
  return metaData;
}
private ArrayList<FishSettings> loadFishSettings(){
  String[] abilities = loadMetaData("ABILITIES");
  String[] lexicons = loadMetaData("LEXICON");
  String[] renderData = loadMetaData("RENDER");
  ArrayList<FishSettings> settings = new ArrayList<FishSettings>();
  for (int i = 0; i < abilities.length;i++){
     String[] lexiconSplit = lexicons[i].split(",");
     String[] abilitiesSplit = abilities[i].split(",");
     settings.add(new FishSettings(loadImage(renderData[i]),new LexiconArticle(lexiconSplit[0],lexiconSplit[1],lexiconSplit[2]),new AbilityData(Double.parseDouble(abilitiesSplit[0]),Double.parseDouble(abilitiesSplit[2]),Double.parseDouble(abilitiesSplit[1]))));
  }
  return settings;
}
