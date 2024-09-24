//board arrays with positions of specific regles
//in the draw()

void drawBoard() {
  int n = 1;  
  for (int i = 0; i < tab.length; i++) {
    int x = getXorigin(i);
    int y = getYorigin(i);
    
    if (n == 63) {
      imageMode(CENTER);
      image(finish, x, y);
      fill(255);
      textSize(14);
      text("Finish bridge", x, y+45);
    } else if (n % 9 == 0) {
      imageMode(CENTER);
      image(magicgoose, x, y);
      fill(255);
      textSize(14);
      text("Wizard Goose", x, y+45);
    } else if (n == 42) {
      imageMode(CENTER);
      image(maze, x, y);
      fill(255);
      textSize(14);
      text("Goose around", x, y+45);
    } else if (n == 3) {
      imageMode(CENTER);
      image(well, x, y);
      fill(255);
      textSize(14);
      text("Very deep well", x, y+45);
    } else if (n == 52) {
      imageMode(CENTER);
      image(jail, x, y);
      fill(255);
      textSize(14);
      text("Oieskaban", x, y+50);
    } else if (n == 58) {
      imageMode(CENTER);
      image(death, x, y);
      fill(255);
      textSize(14);
      text("Goosilla", x, y+50);
    } else if (n == 19) {
      imageMode(CENTER);
      image(hotel, x, y);
      fill(255);
      textSize(14);
      text("Very-very good hotel", x, y+45);
    } else {
      imageMode(CENTER);
      image(stone, x, y);
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text(n, x, y + 7);
    }
    n++;
  }
  
}
