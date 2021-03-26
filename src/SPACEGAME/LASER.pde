class Laser {
  // member variables
  int x, y, speed, r;
  color c;

  // constructor
  Laser(color c, int x, int y) {
    this.c = c;
    this.x = x;
    this.y = y;
    speed = 3;
    r = 10;
  }

  void fire() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y < -10) {
      return true;
    } else {
      return false;
    }
  }

  // member methods
  void display () {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x, y, r/1.5, r);
  }
}
