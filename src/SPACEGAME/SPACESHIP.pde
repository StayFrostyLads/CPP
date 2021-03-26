class SpaceShip {
  // member variables
  int x, y, health, lives, r, laser;
  color c;
  float easing;

  // constructor
  SpaceShip(color c) {
    x = 0;
    y = 0;
    health = 100;
    lives = 2;
    this.c = c;
    easing = 0.05;
    r = 10;
    laser +=20;
  }

  // Asteroid vs Ship Collision
  boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist(x, y, asteroid.x, asteroid.y);
    if (distance < r + asteroid.r) {
      return true;
    } else {
      return false;
    }
  }

  // PowerUp vs Ship Collision
  boolean puIntersection(PowerUp pu) {
    float distance = dist(x, y, pu.x, pu.y);
    if (distance < r + pu.r) {
      return true;
    } else {
      return false;
    }
  }

  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    rectMode(CENTER);
    stroke(128);
    fill(255, 0, 0);
    rect(x+20, y+20, 8, 13);
    rect(x-20, y+20, 8, 13);
    line(x+25, y+20, x+25, y);  
    fill(0, 255, 255);
    line(x-25, y+20, x-25, y);
    triangle(x, y-10, x+30, y+20, x-30, y+20);
    fill(122);
    ellipse(x, y, 20, 60);
  }
}
