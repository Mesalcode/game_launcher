class FishSettings{
  PImage image;
  LexiconArticle lexiconArticle;
  AbilityData abilityData;
  FishSettings(PImage image, LexiconArticle lexiconArticle, AbilityData abilityData){
    this.image = image;
    image.resize((int)(image.width*abilityData.size*gSizeMultiplicator),(int)(image.height*abilityData.size*gSizeMultiplicator));
    this.lexiconArticle = lexiconArticle;
    this.abilityData = abilityData;
  }
}
