int sqSize;
int blackHolePrice = 100;
int ghostPrice = 50;
int ghostsPrice = 200;
int magicPrice = 75;
int windPrice = 25;
int wolfPrice = 50;
int birdAPrice = 40;
int birdBPrice = 120;
int birdCPrice = 250;
int catPrice = 400;
int scissorsPrice = 300;
int firePrice = 1500;
int tornadoPrice = 2500;
void shop(){
  sqSize = (int)(displayWidth/7.68);
  fill(255,255,255,10);
  rect(displayWidth/12,displayHeight/12,displayWidth-displayWidth/12*2,displayHeight-displayHeight/12*2);
  textAlign(CENTER);
  fill(0);
  text("Kurze Hilfe",displayWidth/24+displayWidth/5,displayHeight/8);
  text("Dauerhafte Hilfe",displayWidth-displayWidth/12-displayWidth/5,displayHeight/8);
  fill(255,215,0);
  rect(displayWidth/12+30,displayHeight/7,sqSize, sqSize);
  shopBlackHole.resize(sqSize, sqSize);
  image(shopBlackHole,displayWidth/12+30,displayHeight/7);
  text(String.valueOf(blackHolePrice)+"$",displayWidth/12+30+sqSize/2,displayHeight/7+sqSize/2);
  rect(displayWidth/12+sqSize+30,displayHeight/7,sqSize, sqSize);
  shopGhost.resize(sqSize, sqSize);
  image(shopGhost,displayWidth/12+sqSize+30,displayHeight/7);
  text(String.valueOf(ghostPrice)+"$",displayWidth/12+30+sqSize/2+sqSize,displayHeight/7+sqSize/2);
  rect(displayWidth/12+sqSize*2+30,displayHeight/7,sqSize, sqSize);
  shopGhosts.resize(sqSize, sqSize);
  image(shopGhosts,displayWidth/12+sqSize*2+30,displayHeight/7);
  text(String.valueOf(ghostsPrice)+"$",displayWidth/12+30+sqSize/2+sqSize*2,displayHeight/7+sqSize/2);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-30,displayHeight/7,-sqSize, sqSize);
  shopBirdA.resize(sqSize, sqSize);
  image(shopBirdA,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*3-30,displayHeight/7);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-sqSize-30,displayHeight/7,-sqSize, sqSize);
  shopBirdB.resize(sqSize, sqSize);
  image(shopBirdB,displayWidth/12+displayWidth-displayWidth/12*2-sqSize-30,displayHeight/7);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-sqSize*2-30,displayHeight/7,-sqSize, sqSize);
  shopBirdC.resize(sqSize, sqSize);
  image(shopBirdC,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*2-30,displayHeight/7);
  rect(displayWidth/12+30,displayHeight/7+sqSize,sqSize, sqSize);
  shopMagic.resize(sqSize, sqSize);
  image(shopMagic,displayWidth/12+30,displayHeight/7+sqSize);
  text(String.valueOf(magicPrice)+"$",displayWidth/12+30+sqSize/2,displayHeight/7+sqSize+sqSize/2);
  rect(displayWidth/12+30+sqSize,displayHeight/7+sqSize,sqSize, sqSize);
  shopWind.resize(sqSize, sqSize);
  image(shopWind,displayWidth/12+30+sqSize,displayHeight/7+sqSize);
  text(String.valueOf(windPrice)+"$",displayWidth/12+30+sqSize/2+sqSize,displayHeight/7+sqSize+sqSize/2);
  rect(displayWidth/12+30+sqSize*2,displayHeight/7+sqSize,sqSize, sqSize);
  shopWolf.resize(sqSize, sqSize);
  image(shopWolf,displayWidth/12+30+sqSize*2,displayHeight/7+sqSize);
  text(String.valueOf(wolfPrice)+"$",displayWidth/12+30+sqSize/2+sqSize*2,displayHeight/7+sqSize+sqSize/2);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-30-500,displayHeight/7+sqSize,-sqSize, sqSize);
  shopCat.resize(sqSize, sqSize);
  image(shopCat,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*3-30,displayHeight/7+sqSize);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize,displayHeight/7+sqSize,-sqSize, sqSize);
  shopFire.resize(sqSize, sqSize);
  image(shopFire,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*3-30+sqSize,displayHeight/7+sqSize);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-30,displayHeight/7+sqSize,-sqSize, sqSize);
  shopTornado.resize(sqSize, sqSize);
  image(shopTornado,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*3-30+500,displayHeight/7+sqSize);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-30-500,displayHeight/7+sqSize*2,-sqSize, sqSize);
  shopScissors.resize(sqSize, sqSize);
  image(shopScissors,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*3-30,displayHeight/7+sqSize*2);
  
  textAlign(LEFT);
}
void handleShopPress(int mX,int mY){
  if (inChunk(mX,mY,displayWidth/12+30,displayHeight/7))
    applyPurchase(blackHolePrice,blackHole);
  else if (inChunk(mX,mY,displayWidth/12+sqSize+30,displayHeight/7))
    applyPurchase(ghostPrice,ghostKidnapping);
  else if (inChunk(mX,mY,displayWidth/12+sqSize*2+30,displayHeight/7)){
    if (ghostsPrice<=coins){
      coins -= ghostsPrice;
      shopMode = false;
      for (int i = 0; i < (int)random(6)+1;i++){
        ghostKidnapping.exec();
      }
  }
  }else if (inChunk(mX,mY,displayWidth/12+30,displayHeight/7+sqSize))
    applyPurchase(magicPrice,magic);
   else if (inChunk(mX,mY,displayWidth/12+30+sqSize,displayHeight/7+sqSize))
    applyPurchase(windPrice,wind);
   else if (inChunk(mX,mY,displayWidth/12+30+sqSize*2,displayHeight/7+sqSize))
     applyPurchase(wolfPrice,wolfChase);
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize,displayHeight/7))
     applyPurchase(birdBPrice,summonBirdB);
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize*2,displayHeight/7))
     applyPurchase(birdCPrice,summonBirdC);
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize*3,displayHeight/7))
     applyPurchase(birdAPrice,summonBird);
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize,displayHeight/7+sqSize))
     applyPurchase(catPrice, summonCat);
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize*2,displayHeight/7+sqSize))
     applyPurchase(firePrice,new CursorFlame());
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-30-sqSize*3,displayHeight/7+sqSize))
     applyPurchase(tornadoPrice,new CursorTornado());
   else if (inChunk(mX,mY,displayWidth/12+displayWidth-displayWidth/12*2-sqSize*3-30,displayHeight/7+sqSize*2))
     applyPurchase(scissorsPrice,new CursorScissors());
}
boolean inChunk(int mX,int mY,int tX, int tY){
  return mX>tX&mX<tX+sqSize&mY>tY&mY<tY+sqSize;
}
void applyPurchase(int price, Ability toExec){
  if (price<=coins){
      toExec.exec();
      coins-=price;
      shopMode = false;
    }
}
void applyPurchase(int price, Upgrade toExec){
  if (price<=coins){
      toExec.exec();
      coins-=price;
      shopMode = false;
    }
}
void applyPurchase(int price, Cursor toApply){
  if (price<=coins){
      toApply.init();
      activeCursor = toApply;
      coins-=price;
      shopMode = false;
    }
}
