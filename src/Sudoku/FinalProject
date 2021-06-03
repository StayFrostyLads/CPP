#include <iostream>
#include <string>
using namespace std;
#define N 9
// Sudoku Solver last updated by Jack Nebeker 6/2/2021

class Display {
 public:
    // A function to print the grid
    void print(int arr[N][N])
      {
        for (int i = 0; i < N; i++)
        {
          for (int j = 0; j < N; j++)
              std::cout << arr[i][j] << " ";
            std::cout << std::endl;
        }
      }
};

class BoxColRowCheck {
  public:
    // Check to see if we are able to assign a number to a given row, col and box
      bool numberCheck(int board[N][N], int row, int col, int num)
      {
        // Check to see if we find the same number in a row, return false if so
      for (int x = 0; x <= 8; x++)
        if (board[row][x] == num)
          return false;
        // Check to see if we find the same number in a column, return false if so
      for (int x = 0; x <= 8; x++)
        if (board[x][col] == num)
          return false;

      int beginningRow = row - row % 3;
      int beginningCol = col - col % 3;

      for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
          if (board[i + beginningRow][j + beginningCol] == num)
              return false;

      return true;
      }
};

class Sudoku {
  public:

    // Calling necessary method from BoxColRowCheck class
    BoxColRowCheck check;
    
    bool solveSudoku(int board[N][N], int row, int col) {
      // Check to see if we have reached the 8th row and 9th column
    if (row == N - 1 && col == N)
        return true;
      // Check to see if we have reached the 9th column in which case we go to the next row
    if (col == N) {
        row++;
        col = 0;
    }
      // Check to see if the position of the board already contains a non zero value, iterate for next column
    if (board[row][col] != 0)
        return solveSudoku(board, row, col + 1);

     for (int num = 1; num <= N; num++)
    {
      // Check to see if we are allowed to place the num (1-9) in the given row and column, in which case we move to next column
      if (check.numberCheck(board, row, col, num))
      {
        board[row][col] = num;
      // Check for next possible num for next column
        if (solveSudoku(board, row, col + 1))
            return true;
      }
      // Removing the assigned number if it can't go there and try the next number
      board[row][col] = 0;
    }
    return false;
  }
};

class UserInput {
  public:

    void inputSudoku(int userBoard[N][N]) {
        for (int i = 0; i < N; i++)
          for (int j = 0; j < N; j++)
            std::cin >> userBoard[i][j];
    }
};

class UserSudoku {
  public:

    // Calling necessary method from BoxColRowCheck class
    BoxColRowCheck check;
 
    bool solveuserBoard(int userBoard[N][N], int row, int col){

      // Check to see if we have reached the 8th row and 9th column
    if (row == N - 1 && col == N)
        return true;
      // Check to see if we have reached the 9th column in which case we go to the next row
    if (col == N) {
        row++;
        col = 0;
    }
      // Check to see if the position of the board already contains a non zero value, iterate for next column
    if (userBoard[row][col] != 0)
        return solveuserBoard(userBoard, row, col + 1);

     for (int num = 1; num <= N; num++) {
      // Check to see if we are allowed to place the num (1-9) in the given row and column, in which case we move to next column
      if (check.numberCheck(userBoard, row, col, num))
      {
        userBoard[row][col] = num;
      // Check for next possible num for next column
        if (solveuserBoard(userBoard, row, col + 1))
            return true;
      }
      // Removing the assigned number if it can't go there and try the next number
      userBoard[row][col] = 0;
    } 
    return false;
  }

  bool inputCheck(int userBoard[N][N]) {
      int counter = 0;
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          if (userBoard[i][j] != 0) {
            counter++;
            if (check.numberCheck(userBoard, i, j, userBoard[i][j])){
              return false;
            }
          }
        }
      }
    if (counter < 17) {
    return false;
    }
    return true;
  }
};

int main() {
  // Calling necessary methods from classes
  Sudoku solve;
  Display print;
  UserInput user;
  UserSudoku answer;
  UserSudoku check;

  // Initial BoardArray using constant variables that were declared
   int board[N][N] = {
   0, 0, 5,   0, 0, 0,   0, 0, 0,
   0, 0, 0,   0, 0, 0,   5, 8, 0,
   0, 9, 0,   2, 0, 0,   0, 0, 0,

   0, 0, 0,   0, 0, 8,   1, 7, 0,
   0, 3, 9,   0, 6, 0,   0, 0, 0,
   0, 0, 2,   0, 0, 0,   0, 0, 0,

   0, 0, 0,   0, 7, 0,   0, 0, 3,
   0, 0, 0,   0, 0, 0,   0, 0, 9,
   1, 0, 0,   0, 0, 5,   0, 0, 0
};

 /*{
   3, 7, 5,   4, 8, 6,   9, 2, 1,
   6, 2, 1,   7, 3, 9,   5, 8, 4,
   4, 9, 8,   2, 5, 1,   6, 3, 7,

   5, 6, 4,   3, 9, 8,   1, 7, 2,
   7, 3, 9,   1, 6, 2,   8, 4, 5,
   8, 1, 2,   5, 4, 7,   3, 9, 6,

   9, 5, 6,   8, 7, 4,   2, 1, 3,
   2, 8, 7,   6, 1, 3,   4, 5, 9,
   1, 4, 3,   9, 2, 5,   7, 6, 8
}; */
std::cout << "Welcome to Jack's Sudoku Solver!" << std::endl;
std::cout << "Example of starting puzzle: " << std::endl;
std::cout << "0 0 5 0 0 0 0 0 0\n";
std::cout << "0 0 0 0 0 0 5 8 0\n";
std::cout << "0 9 0 2 0 0 0 0 0\n";
std::cout << "0 0 0 0 0 8 1 7 0\n";
std::cout << "0 3 9 0 6 0 0 0 0\n";
std::cout << "0 0 2 0 0 0 0 0 0\n";
std::cout << "0 0 0 0 7 0 0 0 3\n";
std::cout << "0 0 0 0 0 0 0 0 9\n";
std::cout << "1 0 0 0 0 5 0 0 0\n"; 
std::cout << "Example of solved puzzle: " << std::endl;

if (solve.solveSudoku(board, 0, 0))
    print.print(board);

int userBoard[N][N] = { };

std::cout << "Please enter numbers in the format shown, 17 integers (1-9) is the minimum amount required\nfor a puzzle with a solution, once you enter all 81 numbers, the solved puzzle will print.\nIf you enter in an invalid puzzle, you will be told so.\n";

user.inputSudoku(userBoard);
std::string spacing("||==============||\n");
if (check.inputCheck(userBoard) && answer.solveuserBoard(userBoard, 0, 0)) {
    cout << spacing;
    print.print(userBoard);
} else {
    std::cout << "You have entered an invalid puzzle.";
  return 0;
  }
}
