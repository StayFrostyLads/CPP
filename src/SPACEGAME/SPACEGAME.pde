// SpaceGame 2020 December
// by Jack Nebeker
SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
ArrayList<PowerUp> pUps;
Timer timer, puTimer;
int pass, score, level, weaponCount;
boolean play;
import processing.sound.*;
SoundFile laser;
SoundFile explosion;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(#23F081);
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  pUps = new ArrayList();
  timer = new Timer(int(random(1000, 4000)));
  puTimer = new Timer(int(random(10000, 20000)));
  timer.start();
  puTimer.start();
  score = 0;
  pass = 0;
  weaponCount = 1;
  level = 1;
  play = false;
  laser = new SoundFile(this, "select2.wav");
  explosion = new SoundFile(this, "Slime-gun-06.wav");
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    size(500, 500);
    background(0);
      
      stars.add(new Star(int(random(width)), int(random(height)), color(random(190, 255))));
      for (int i = 0; i < stars.size(); i++) {
        Star star = stars.get(i);
        star.display();
        star.move();
        if (star.reachedBottom()) {
          stars.remove(star);
        }
      }


      if (timer.isFinished()) {
        asteroids.add(new Asteroid(int(random(width)), -50));
        timer.start();
      }

      // add remove code
      for (int i = 0; i < asteroids.size(); i++) {
        Asteroid asteroid = asteroids.get(i);
        asteroid.display();
        asteroid.move();
        // Asteroid vs Ship Collision
        if (s1.asteroidIntersection(asteroid)) {
          s1.health-=asteroid.health;
          asteroids.remove(asteroid);
        }
        if (asteroid.reachedBottom()) {
          pass++;
          asteroids.remove(asteroid);
        }
      }

      for (int i = 0; i < lasers.size(); i++) {
        Laser laser = lasers.get(i);
        laser.display();
        laser.fire();
        // Laser vs Asteroid Collision
        for (int j = 0; j <asteroids.size(); j++) {
          Asteroid asteroid = asteroids.get(j);
          if (asteroid.laserIntersection(laser)) {
            asteroid.health-=30;
            lasers.remove(laser);
            if (asteroid.health<1) {
              asteroids.remove(asteroid);
              score-=asteroid.health;
            }
          }
        }
        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
      }
      // PowerUp Distribution
      if (puTimer.isFinished()) {
        pUps.add(new PowerUp(int(random(width)), -20));
        puTimer.start();
      }
      // PowerUp Spawning
      for (int i = 0; i < pUps.size(); i++) {
        PowerUp pu = pUps.get(i);
        pu.display();
        pu.move();
        // PowerUp and Ship Intersection
        if (s1.puIntersection(pu)) {
          // Apply PowerUp
          if (pu.pu == 0 && key == ' ') { // Adds high-powered laser
            s1.laser+=20; // (One shots every asteroid)
          } else if (pu.pu == 1) { // Adds an extra life
            s1.lives+=1;
          } else if (pu.pu == 2) { // Adds an extra laser
            weaponCount++;
          }
          pUps.remove(pu);
        }
        if (pu.reachedBottom()) {
          pUps.remove(pu);
        }
      }
      infoPanel();



      // GameOver Logic
      if (s1.health<1 || pass>10) {
        play = false;
        gameOver();
      }
      s1.display(mouseX, mouseY);
    }
}


  void mouseReleased() {
    laser.play();
    if (weaponCount == 1) {
      lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
    } else if (weaponCount == 2) {
      lasers.add(new Laser(color(255, 0, 0), s1.x-15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+15, s1.y));
    } else if (weaponCount == 3) {
      lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+15, s1.y));
    } else if (weaponCount == 4) {
      lasers.add(new Laser(color(255, 0, 0), s1.x-15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-30, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+30, s1.y));
    } else if (weaponCount == 5) {
      lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-30, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+30, s1.y));
    } else if (weaponCount == 6) {
      lasers.add(new Laser(color(255, 0, 0), s1.x-15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-30, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+30, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-45, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+45, s1.y));
    } else if (weaponCount >= 7) {
      lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+15, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-30, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+30, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x-45, s1.y));
      lasers.add(new Laser(color(255, 0, 0), s1.x+45, s1.y));
    }
  }

  void keyPressed() {
    // use space bar for firing
    explosion.play();
    if (key == ' ') {
      s1.laser+=20;
      lasers.add(new Laser(color(0, 255, 0), s1.x, s1.y));
    }
  }

  void startScreen() {
    background(0);
    textAlign(CENTER);
    text("Welcome to Jack Nebeker's Space Game!", width/2, height/2);
    text("Click anywhere to continue to the game", width/2, height/2+20);

    if (mousePressed) {
      play = true;
    }
  }

  void infoPanel() {
    fill(128, 128);
    rectMode(CORNER);
    rect(0, height-50, width, 70);
    fill(255, 158);
    text("Health: " + s1.health, 40, height-20);
    text("Lives: " + s1.lives, 170, height-20);
    text("Score: " + score, 340, height-20);
    text("Missed: " + pass, 450, height-20);
  }

  void gameOver() {
    background(0);
    textAlign(CENTER);
    fill(200);
    text("Game Over! Feel free to play again!", width/2, height/2);
    text("Final Score:" + score, width/2, height/2+20);
    noLoop();
  }
