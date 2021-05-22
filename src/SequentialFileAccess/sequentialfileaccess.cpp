#include <iostream>
#include <fstream>
#include <stdlib.h> 
#include <time.h>  

int main() {
  srand (time(NULL));
  char data[100];
  std::string Questions[10] = {"Do you enjoy school?", "What is your favorite color and why?", "What is your favorite drink?", "What is your favorite class?", "Do you enjoy sports?", "What do you do for entertainment?", "How are you feeling today?", "What is your favorite Pokemon?", "Do you enjoy watching television?", "Do you spend too much time on your phone?"};

  std::ofstream outfile;
  outfile.open("output.txt");

  std::cout << "Writing to the file..." << std::endl;
  
  int randQuestion = rand() % 10;
  std::cout << Questions[randQuestion] << std::endl;
  std::cin.getline(data, 100);

  outfile << data << std::endl;

  outfile.close();
}