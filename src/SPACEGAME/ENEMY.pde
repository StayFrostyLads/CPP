class Enemy {
  // member variables
  int x, y, health, lives;
  color c;
  float easing;

  // constructor
  Enemy(color c) {
    x = 0;
    y = 0;
    health = 100;
    lives = 2;
    this.c = c;
  }

  // member methods
  void display() {}
}
