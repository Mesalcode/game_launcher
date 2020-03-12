class GameObjectThreadManager{
  Call[] calls;
  GameObjectThreadManager(Call[] calls){
    this.calls = calls;
  }
  void setCalls(Call[] calls){
    this.calls = calls;
  }
  void executeAll(){
     for (Call currentCall : calls){
      elementSeparator.sectionStart();
      GameObjectThread currentGOT = new GameObjectThread();
      currentGOT.setCall(currentCall);
      currentGOT.run();
      elementSeparator.sectionEnd();
  }
  }
}
