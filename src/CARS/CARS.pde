Car[] cars;
int numCars = 200;
void setup() {
  size(1000, 1000);
  cars = new Car[numCars];
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car(#2EF388);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}
