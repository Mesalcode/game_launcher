 class Effect{
   String name;
   String upsizedName = "Ressourcen/unavailable.png";
   void apply(){save("Zwischenablage/save"+saveStatus+".png");saveStatus++;}
 }

   class Poster extends Effect{
     Poster(){
       upsizedName = "Ressourcen/poster.png";
     }
        @Override
   void apply(){
    super.apply(); 
    filter(POSTERIZE,4);
    save("Zwischenablage/save"+saveStatus+".png");saveStatus++;
   }
   }
   
   class Invert extends Effect{
        Invert(){
       upsizedName = "Ressourcen/invert.png";
     }
      @Override
   void apply(){
    super.apply(); 
    filter(INVERT);
    save("Zwischenablage/save"+saveStatus+".png");saveStatus++;
   }
   }
 class Blur extends Effect{
      Blur(){
       upsizedName = "Ressourcen/blur.png";
     }
    @Override
   void apply(){
    super.apply(); 
    filter(BLUR,6);
    save("Zwischenablage/save"+saveStatus+".png");saveStatus++;
   }
   
 }
 class BlackAndWhite extends Effect{
      BlackAndWhite(){
       upsizedName = "Ressourcen/gray.png";
     }
   @Override
   void apply(){
    super.apply(); 
    filter(GRAY);
    save("Zwischenablage/save"+saveStatus+".png");saveStatus++;
   }
   
 }
  class Threshold extends Effect{
      Threshold(){
       upsizedName = "Ressourcen/threshold.png";
     }
   @Override
   void apply(){
    super.apply(); 
    filter(THRESHOLD);
    save("Zwischenablage/save"+saveStatus+".png");saveStatus++;
   }
  }
