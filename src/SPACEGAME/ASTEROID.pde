class Asteroid {
  // member variables
  int x, y, health, speed, r;

  // constructor
  Asteroid(int x, int y) {
    this.x = x;
    this.y = y;
    health = int(random(20,40));
    speed = int(random(2, 5));
    r = 10;
  }

  // Laser vs Asteroid Intersection
  boolean laserIntersection(Laser laser){
    float distance = dist(x,y,laser.x,laser.y);
    if(distance < r + laser.r) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  // member methods
  void display () {
    if (health>30) {
      fill(255, 255, 51);
      ellipse(x, y, health, health);
      speed = int(random(2, 3));
    } else if (health<30) {
      noStroke();
      fill(128);
      ellipse(x, y, health, health);
      speed = int(random(4, 5));
    }
  }
}
