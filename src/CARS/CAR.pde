class Car {
  // member variables
  color c; 
  float xpos, ypos, xspeed;

  // constructor
  Car(color c) {
    this.c = c;
    xpos = random(width);
    ypos = random(height);
    xspeed = random(-10, 10);
  }

  void display () {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10, 3);
    fill(255);
    ellipse(xpos-7, ypos-6, 5, 5);
    ellipse(xpos-7, ypos+6, 5, 5);
    ellipse(xpos+7, ypos-6, 5, 5);
    ellipse(xpos+7, ypos+6, 5, 5);
    if (xspeed > 0) {
      fill(255, 255, 0);
      triangle(xpos+11, ypos+1, xpos+18, ypos+5, xpos+18, ypos);
      triangle(xpos+11, ypos-2, xpos+18, ypos-6, xpos+18, ypos);
      fill(0);
      quad(xpos+8, ypos+2, xpos+4, ypos+1, xpos+4, ypos-1, xpos+8, ypos-2);
    } else if (xspeed < 0) {
      fill(255, 255, 0);
      triangle(xpos-11, ypos+1, xpos-18, ypos+5, xpos-18, ypos);
      triangle(xpos-11, ypos-2, xpos-18, ypos-6, xpos-18, ypos);
      fill(0);
      quad(xpos-8, ypos+2, xpos-4, ypos+1, xpos-4, ypos-1, xpos-8, ypos-2);
    }
  }

  void drive() {
    xpos += xspeed;
    if (xpos > width) {
      xpos = 0;
    } else if (xpos < 0) {
      xpos = 1000;
    }
  }
}
