class Button {
  // Member Variable
  int x, y, w, h;
  color c1, c2, c3, c4;
  String val;
  boolean hover, isNumber;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = #4068D3;
    c2 = #B4C6F7;
    c3 = #eb34e5;
    c4 = #F6D117;
    val = tempVal;
    hover = false;
    this.isNumber = isNumber;
  }

  // Display Method
  void display() {
    if (isNumber) { // formatting buttons as numbers
      if (hover) {
        fill(c4);
      } else {
        fill(c3);
      }
      ellipseMode(CENTER);
      ellipse(x, y-5, w, h);
      textAlign(CENTER);
      fill(0);
      textSize(12);
      text(val, x, y);
    } else { // formatting buttons as operators
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      rectMode(CENTER);
      rect(x, y, w, h, 8);
      textAlign(CENTER);
      fill(0);
      textSize(12);
      text(val, x, y);
    }
  }
    // Hover Method
    void hover(int tempX, int tempY) {
      hover = tempX>x-w/2 && tempX<x+w/2 && tempY>y-h/2 && tempY<y+h/2;
    }
  }
