//portal animation in the draw()
void portals(){
  frameNum++;
  frameNum %= portal.length;
  imageMode(CENTER);
  int Y =100;
  int X =100;
  for ( int y=0; y<7; y++) {
    for   (int x=0; x<2; x++) {
      if (x==0) {
        if (X==100 && Y==100) {
          continue;
        }
        image(wall, Y, X-5);
        image(portal[frameNum], Y, X);
      }
      if (x==1) {
        Y += 1000;
        if (X==700 && Y==1100) {
          continue;
        }
        image(wall, Y, X-5);
        image(portal[frameNum], Y, X);
        Y=100;
        X+=100;
      }
    }
  }
}
