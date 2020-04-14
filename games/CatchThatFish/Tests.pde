void testMoveAroundFreelyWithArrowKeys(int keyCodeInput){
 switch (keyCodeInput){
   case DOWN:
     camera.moveY(10);
     break;
   case UP:
     camera.moveY(-10);
     break;
 }
}
