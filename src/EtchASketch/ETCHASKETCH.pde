// Global Variables
int x,y;

void setup() {
  size(400,400);
  frameRate(10);
  x = 10;
  y = 10;
}

void draw() {
  fill(0);
  strokeWeight(3);
  if(keyPressed) {
    if(key == 'd' || key == 'D') {
      moveRight(5);
    } else if(key == 'a' || key == 'A') {
      moveLeft(5);
    } else if(key == 'w' || key == 'W') {
      moveUp(5);
    } else if(key == 's' || key == 'S') {
      moveDown(5);
    }
  }
  //drawName();
  //noLoop();
}

void mouseClicked() {
  saveFrame("image-####.png");
}



void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      moveRight(5);
    } else if(keyCode == LEFT) {
      moveLeft(5);
    } else if(keyCode == UP) {
      moveUp(5);
    } else if(keyCode == DOWN) {
      moveDown(5);
    }
  }
}

// Algorithm for your first name
void drawName() {
  //moveRight(100);
  //moveLeft(50);
  //moveDown(75);
  //moveLeft(50);
  //moveUp(20);
  //moveDown(20);
  //moveRight(50);
  //moveUpRight(75);
  //moveDownLeft(25);
  //moveRight(50);
  //moveLeft(50);
  //moveUpRight(25);
  //moveDownRight(75);
  //moveUp(75);
  //moveRight(50);
  //moveLeft(50);
  //moveDown(75);
  //moveRight(50);
  //moveUpRight(20);
  //moveUp(55);
  //moveDown(75);
  //moveUp(35);
  //moveUpRight(40);
  //moveDownLeft(40);
  //moveDownRight(40);
}

// Method to draw right lines
void moveRight(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x+i,y);
  }
  x=x+rep;
}

// Method to draw left lines
void moveLeft(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x-i,y);
  }
  x=x-rep;
}

// Method to draw up lines
void moveUp(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x,y-i);
  }
  y=y-rep;
}

// Method to draw down lines
void moveDown(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x,y+i);
  }
  y=y+rep;
}

// Method to draw down right lines
void moveDownRight(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x+i,y+i);
  }
  y=y+rep;
  x=x+rep;
}

// Method to draw up right lines
void moveUpRight(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x+i,y-i);
  }
  y=y-rep;
  x=x+rep;
}

// Method to draw up left lines
void moveUpLeft(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x-i,y-i);
  }
  y=y-rep;
  x=x-rep;
}

// Method to draw down left lines
void moveDownLeft(int rep) {
  for(int i = 0; i<rep; i++) {
    point(x-i,y+i);
  }
  y=y+rep;
  x=x-rep;
}
