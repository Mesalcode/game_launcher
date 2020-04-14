void testMoveAroundFreelyWithArrowKeys(int keyCodeInput){
 camera.moveY(keyCodeInput == DOWN ? 10 : (keyCodeInput == UP ? -10 : 0));
}
