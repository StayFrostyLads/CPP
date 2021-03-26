class PowerUp {
  // member variables
  int x, y, speed, r, pu;
  String[] puInfo = {"Big Laser, Press Space", "Extra Life", "Extra Lasers"};
  
  PowerUp(int x, int y) {
    r = 20;
    this.x = x;
    this.y = y;
    speed = int(random(3,5));
    pu = int(random(3));
  }

  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if (y > height + r*3) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    noStroke();
    switch(pu) {
      case 0: // High-Powered Laser
      fill(0,0,255);
      rect(x,y,r,r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[0], x,y);
      break;
      case 1: // Extra Life
      fill(0,0,255);
      rect(x,y,r,r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[1], x,y);
      break;
      case 2: // Extra Lasers
      fill(0,0,255);
      rect(x,y,r,r);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[2], x,y);
      break;
    }
  }
}

      
