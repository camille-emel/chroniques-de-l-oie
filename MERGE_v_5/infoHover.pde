//all the info while mouse hover over the cas

void finishCastle() {
  boolean isInside =false;
  int x =1200;
  int y =450;
  if (mouseX>x && mouseX<x+300 && mouseY >y && mouseY< y+400) {
    isInside=true;
  }

  if (isInside==true) {
    fill(0, 153, 0);
    textSize(18);
    textAlign(LEFT);
    text("Finish Castle", 1236, 78, 176, 135);
    fill(0);
    textSize(18);
    textAlign(LEFT);
    text("Legend says it belonged to the Fins, but one letter n felt off.", 1236, 100, 176, 135);
  }
}

void finishBridge () {
  boolean isInside =false;
  int x =950;
  int y =650;
  if (mouseX>x && mouseX<x+100 && mouseY >y && mouseY< y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(0, 153, 0 );
    textSize(18);
    textAlign(LEFT);
    text("Finish Bridge", 1236, 78, 176, 135);
    fill(0);
    textSize(16);
    text("Only way how to get to the Finish castle.", 1236, 100, 176, 135);
    fill(0, 128, 255);
    text("If a player falls on it, he wins.", 1236, 140, 176, 135);
  }
}

void gooseAround() {
  boolean isInside =false;
  int x =650;
  int y =450;
  if (mouseX>x && mouseX<x +100 && mouseY >y && mouseY<y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(213, 36, 36);
    textSize(18);
    textAlign(LEFT);
    text("Goose around", 1236, 78, 176, 135);
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("A great place to get lost. Funny though.", 1236, 98, 176, 135);
    fill(0, 128, 255);
    text("If a player falls on it, he goes back to square 30.", 1236, 138, 176, 135);
  }
}

void hotel() {
  boolean isInside =false;
  int x =150;
  int y =250;
  if (mouseX>x && mouseX<x+100 && mouseY >y && mouseY< y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(213, 36, 36);
    textSize(18);
    textAlign(LEFT);
    text("Very-very good hotel", 1236, 78, 176, 135);
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("It has a swimming pool!", 1236, 98, 176, 135);
    fill(0, 128, 255);
    text("If a player falls on it, he passes 2 rounds.", 1236, 123, 176, 135);
  }
}

void oieskaban() {
  boolean isInside =false;
  int x =750;
  int y =550;
  if (mouseX>x && mouseX<x+100 && mouseY >y && mouseY< y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(213, 36, 36);
    textSize(18);
    textAlign(LEFT);
    text("Oieskaban", 1236, 78, 176, 135);
    fill(0);
    textSize(15);
    textAlign(LEFT);
    text("Dangerous prison. Hard to get out alone. Make a friend!", 1236, 98, 176, 135);
    fill(0, 128, 255);
    textSize(12);
    text("If a player falls on it, he has to wait for another player to go to prison before releasing him.", 1236, 153, 176, 135);
  }
}

void oiezilla () {
  boolean isInside =false;
  int x =450;
  int y =650;
  if (mouseX>x && mouseX<x+100 && mouseY >y && mouseY< y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(213, 36, 36);
    textSize(18);
    textAlign(LEFT);
    text("Goosilla", 1236, 78, 176, 135);
    fill(0);
    textSize(12);
    textAlign(LEFT);
    text("In French known as Oiezilla", 1236, 98, 176, 135);
    textSize(16);
    text("Ancient monster with devastating power.", 1236, 110, 176, 135);
    fill(0, 128, 255);
    text("If a player falls on it, he returns to the beginning.", 1236, 150, 176, 135);
  }
}

void portalReturn () {
  boolean isInside =false;
  int x =50;
  int y =50;
  if (mouseX>x && mouseX<x +100 && mouseY >y && mouseY<y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(0, 153, 0);
    textSize(18);
    textAlign(LEFT);
    text("Portal of no return", 1236, 78, 176, 135);
    fill(0);
    textSize(18);
    textAlign(LEFT);
    text("It has some weird writings on it.", 1236, 98, 176, 135);
    fill(153, 76, 0);
    text("3 & 6 --> 26", 1236, 138, 176, 135);
    text("4 & 5 --> 53", 1236, 158, 176, 135);
    text("6 --> 12", 1236, 178, 176, 135);
  }
}

//portal of no return + castle image + sign right upper corner
//no specific meaning yet

void startFinish() { //start portal
  fill(255);
  textSize(14);
  text("Portal of no return", 100, 50);
  image(start, 100, 100);


  //just a castle in the corner
  image(castle, 1380, 634);
  fill(255);
  textSize(20);
  text("Finish castle", 1300, 550);


  //info sign
  image(sign, 1320, 140);
}

void well() {
  boolean isInside =false;
  int x =350;
  int y =50;
  if (mouseX>x && mouseX<x+100 && mouseY >y && mouseY< y+100) {
    isInside=true;
  }

  if (isInside==true) {
    fill(213, 36, 36);
    textSize(18);
    textAlign(LEFT);
    text("Very deep well", 1236, 78, 176, 135);
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("It's very deep.", 1236, 98, 176, 135);
    fill(0, 128, 255);
    textSize(12);
    text("Player must wait for another player to arrive at the same number. The other player will fall into the well and have to wait to be rescued.", 1236, 130, 170, 130);
  }
}

void wizardGoose () {
  boolean isInside =false;
  int x =950;
  int y =50;
  if (mouseX>x && mouseX<x +100 && mouseY >y && mouseY<y+600) {
    isInside=true;
  }

  if (isInside==true) {
    fill(0, 153, 0);
    textSize(18);
    textAlign(LEFT);
    text("Wizard goose", 1236, 78, 176, 135);
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("Powerful mage protecting a portal.", 1236, 98, 176, 135);
    fill(0, 128, 255);
    text("If a player falls on it, he re-advances his throw.", 1236, 138, 176, 135);
  }
}
