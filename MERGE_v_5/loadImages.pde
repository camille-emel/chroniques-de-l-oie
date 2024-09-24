//must be in the setup
void loadImages () {
  for (int i=0; i<portal.length; i++) {
    portal[i] =loadImage("portal"+i+".png");
  }
  for (int i=0; i<6; i++) {
    dice[i] = loadImage("tile0"+i+".png");
  }
  wall = loadImage("wall.png");
  stone = loadImage("stone.png");
  magicgoose = loadImage("magicgoose.png");
  bg = loadImage("bg.png");
  maze = loadImage("maze.png");
  well = loadImage("well.png");
  jail = loadImage("jail.png");
  death = loadImage("death.png");
  hotel = loadImage("hotel.png");
  finish = loadImage("finish.png");
  castle = loadImage("castle.png");
  start = loadImage("start.png");
  sign = loadImage("sign.png");
  scroll = loadImage("scroll.png");
}
