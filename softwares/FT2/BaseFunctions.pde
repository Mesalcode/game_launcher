void setBrushSize(int newSize){brushSize=newSize;strokeWeight(brushSize);};
 void setBrushColor(int newColorR,int newColorG,int newColorB){brushColorR=newColorR;brushColorG=newColorG;brushColorB=newColorB;stroke(newColorR,newColorG,newColorB);};
 void setMaxBrushSize(int newSize){maxBrushSize=newSize;}
 void refreshFilled(){fill(brushColorR,brushColorG,brushColorB);}
 void disableFilling(){fill(0,0);}
 void toggleFilling(){
   if (filled){
 filled=false;disableFilling();
   }else{
 filled=true;refreshFilled();
 }
   }
 //
void loadImage(){
  JFileChooser j = new JFileChooser(); 
 
  String chosenFile;
  int dialogSuccesValue = j.showOpenDialog(null);
  if (dialogSuccesValue==JFileChooser.APPROVE_OPTION){
    try {
    chosenFile = j.getSelectedFile().getAbsolutePath();
    loadedImage = loadImage(chosenFile);
     
    image(loadedImage,(width-loadedImage.width)/2,(height-loadedImage.height)/2);
     loadOnClick = true;
       }catch (Exception e){
      showMessageDialog(null,"Datei konnte nicht gelesen werden.\nIst das wirklich ein Bild?"
      ,"Fehler",ERROR_MESSAGE);
      
      
    }
  }
 
}
void getUserColor(){
  Color userColor = new ColorChooserController().letUserChoose();
    if (userColor!=null){
    setBrushColor(userColor.getRed(),
    userColor.getGreen(),
   userColor.getBlue());
    }
    if (filled)
     refreshFilled();
}
class ColorChooserController extends JFrame{
public Color letUserChoose() {    
Color initialcolor= new Color(brushColorR,brushColorG,brushColorB);  
Color userColor=JColorChooser.showDialog(this,"Wähle eine Farbe",initialcolor);    
return userColor;
  }
}
