/*
2020 Calculator for Programming I
 Jack Nebeker | Nov 18 2020
 Colors: numButtons #F43A13, #F6D117
 opButtons #4068D3, #B4C6F7
 */



Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String displayValue;
String op = ""; // operator to use in a calculation
float r = 0.0; // what is right of the operator
float l = 0.0; // what is left of the operator
float result = 0.0; // the answer
boolean left = true;

void setup() {
  size(350, 510);
  displayValue = "0";
  numButtons[0] = new Button(70, 350, 30, 30, "0", true);
  numButtons[1] = new Button(70, 150, 30, 30, "1", true);
  numButtons[2] = new Button(130, 150, 30, 30, "2", true);
  numButtons[3] = new Button(190, 150, 30, 30, "3", true);
  numButtons[4] = new Button(70, 210, 30, 30, "4", true);
  numButtons[5] = new Button(130, 210, 30, 30, "5", true);
  numButtons[6] = new Button(190, 210, 30, 30, "6", true);
  numButtons[7] = new Button(70, 280, 30, 30, "7", true);
  numButtons[8] = new Button(130, 280, 30, 30, "8", true);
  numButtons[9] = new Button(190, 280, 30, 30, "9", true);

  opButtons[0] = new Button(300, 340, 40, 40, "C", false);
  opButtons[1] = new Button(300, 280, 40, 40, "/", false);
  opButtons[2] = new Button(300, 220, 40, 40, "*", false);
  opButtons[3] = new Button(300, 160, 40, 40, "-", false);
  opButtons[4] = new Button(300, 100, 40, 40, "+", false);
  opButtons[5] = new Button(300, 400, 40, 40, "=", false);
  opButtons[6] = new Button(40, 400, 40, 40, "x²", false);
  opButtons[7] = new Button(100, 400, 40, 40, "√", false);
  opButtons[8] = new Button(160, 400, 40, 40, "ln", false);
  opButtons[9] = new Button(220, 400, 40, 40, "log", false);
  opButtons[10] = new Button(130, 340, 30, 30, "±", false);
  opButtons[11] = new Button(190, 340, 30, 30, ".", false);
}

void draw() {
  background(255, 0, 0);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("KEY" + key + "keyCode" + keyCode);

  if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("*", false);
  } else if (key == '/') {
    handleEvent("/", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  }
}

void mousePressed() {
  println("L:" + 1 + "R:" + r + "Op:" + op);
  println("Result:" + result + "Left:" + left);

  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && displayValue.length()<20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}


String handleEvent(String val, boolean num) {
  if (left & num) { // Left Number
    if (displayValue.equals("0") || result == l) {
      displayValue = (val);
      l = float(displayValue);
    } else {
      displayValue += (val);
      l = float(displayValue);
    }
  } else if (!left && num) {
    if (displayValue.equals("0") || result == l) {
      displayValue = (val);
      r = float(displayValue);
    } else {
      displayValue += (val);
      r = float(displayValue);
    }
  } else if (val.equals("C")) {
    displayValue = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {
      performCalculation();
    } else {
      op = "+";
      left = false;
      displayValue = "0";
    }
  } else if (val.equals("-")) {
    op = "-";
    left = false;
    displayValue = "0";
  } else if (val.equals("*")) {
    op = "*";
    left = false;
    displayValue = "0";
  } else if (val.equals("/")) {
    op = "/";
    left = false;
    displayValue = "0";
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      displayValue = str(l);
    } else {
      r = sq(r);
      displayValue = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      displayValue = str(l);
    } else {
      r = sqrt(r);
      displayValue = str(r);
    }
  } else if (val.equals("log")) {
    if (left) {
      l = log(l)/log(10);
      displayValue = str(l);
    } else {
      r = log(r)/log(10);
      displayValue = str(r);
    }
  } else if (val.equals("ln")) {
    if (left) {
      l = log(l)/log(exp(1.0));
      displayValue = str(l);
    } else {
      r = log(r)/log(exp(1.0));
      displayValue = str(r);
    }
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      displayValue = str(l);
    } else {
      r *= -1;
      displayValue = str(r);
    }
  } else if (val.equals(".") && !displayValue.contains(".")) {
    displayValue += (val);
  } else if (val.equals("=")) {
    performCalculation();
  }
  
  return val;
}




void updateDisplay() {
  rectMode(CORNER);
  fill(200);
  rect(10, 10, width-20, 50, 8);
  textSize(20);
  fill(0);
  textAlign(RIGHT);

  // Render Scaling Text
  if (displayValue.length()<13) {
    textSize(32);
  } else if (displayValue.length()<14) {
    textSize(28);
  } else if (displayValue.length()<15) {
    textSize(26);
  } else if (displayValue.length()<16) {
    textSize(24);
  } else if (displayValue.length()<18) {
    textSize(22);
  } else if (displayValue.length()<20) {
    textSize(20);
  } else if (displayValue.length()<22) {
    textSize(18);
  } else if (displayValue.length()<24) {
    textSize(16);
  } else {
    textSize(14);
  }
  text(displayValue, width-40, 50);
  println("displayValue length=" + displayValue.length());
}

void performCalculation() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("/")) {
    result = l / r;
  } else if (op.equals("*")) {
    result = l * r;
  }
  l = result;
  displayValue = str(result);
  left = true;
}
