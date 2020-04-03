void shop(){
  fill(255,255,255,10);
  rect(displayWidth/12,displayHeight/12,displayWidth-displayWidth/12*2,displayHeight-displayHeight/12*2);
  textAlign(CENTER);
  fill(0);
  text("Kurze Hilfe",displayWidth/24+displayWidth/5,displayHeight/8);
  text("Dauerhafte Hilfe",displayWidth-displayWidth/12-displayWidth/5,displayHeight/8);
  fill(125,125,125,10);
  rect(displayWidth/12+30,displayHeight/7,250,250);
  shopBlackHole.resize(250,250);
  image(shopBlackHole,displayWidth/12+30,displayHeight/7);
  rect(displayWidth/12+250+30,displayHeight/7,250,250);
  shopGhost.resize(250,250);
  image(shopGhost,displayWidth/12+250+30,displayHeight/7);
  rect(displayWidth/12+250*2+30,displayHeight/7,250,250);
  shopGhosts.resize(250,250);
  image(shopGhosts,displayWidth/12+250*2+30,displayHeight/7);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-30,displayHeight/7,-250,250);
  shopBirdA.resize(250,250);
  image(shopBirdA,displayWidth/12+displayWidth-displayWidth/12*2-250*3-30,displayHeight/7);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-250-30,displayHeight/7,-250,250);
  shopBirdB.resize(250,250);
  image(shopBirdB,displayWidth/12+displayWidth-displayWidth/12*2-250-30,displayHeight/7);
  rect(displayWidth/12+displayWidth-displayWidth/12*2-250*2-30,displayHeight/7,-250,250);
  shopBirdC.resize(250,250);
  image(shopBirdC,displayWidth/12+displayWidth-displayWidth/12*2-250*2-30,displayHeight/7);
  textAlign(LEFT);
  
}
