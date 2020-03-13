 class Effect{
   String name;
   String upsizedName = "res/unavailable.png";
   void apply(){save("cache/save"+saveStatus+".png");saveStatus++;}
 }

   class Poster extends Effect{
     Poster(){
       upsizedName = "res/poster.png";
     }
        @Override
   void apply(){
    super.apply(); 
    filter(POSTERIZE,4);
    save("cache/save"+saveStatus+".png");saveStatus++;
   }
   }
   
   class Invert extends Effect{
        Invert(){
       upsizedName = "res/invert.png";
     }
      @Override
   void apply(){
    super.apply(); 
    filter(INVERT);
    save("cache/save"+saveStatus+".png");saveStatus++;
   }
   }
 class Blur extends Effect{
      Blur(){
       upsizedName = "res/blur.png";
     }
    @Override
   void apply(){
    super.apply(); 
    filter(BLUR,6);
    save("cache/save"+saveStatus+".png");saveStatus++;
   }
   
 }
 class BlackAndWhite extends Effect{
      BlackAndWhite(){
       upsizedName = "res/gray.png";
     }
   @Override
   void apply(){
    super.apply(); 
    filter(GRAY);
    save("cache/save"+saveStatus+".png");saveStatus++;
   }
   
 }
  class Threshold extends Effect{
      Threshold(){
       upsizedName = "res/threshold.png";
     }
   @Override
   void apply(){
    super.apply(); 
    filter(THRESHOLD);
    save("cache/save"+saveStatus+".png");saveStatus++;
   }
  }
