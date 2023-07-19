import 'dart:io';

int choice = 0;
int? row, column;
List<List<String>> board = [
  ['1', '2', '3'],
  ['4', '5', '6'],
  ['7', '8', '9']
];
var turn = 'X';
bool draw = false;

void drawing() {
  stdout.writeln("PLAYER - 1 [X]\tPLAYER - 2 [O]\n");
  stdout.writeln("      |      |      ");
  stdout.writeln("  ${board[0][0]}   |  ${board[0][1]}   |  ${board[0][2]}   ");
  stdout.writeln(" _____|______|_____ ");
  stdout.writeln("      |      |      ");
  stdout.writeln("  ${board[1][0]}   |  ${board[1][1]}   |  ${board[1][2]}   ");
  stdout.writeln(" _____|______|_____ ");
  stdout.writeln("      |      |      ");
  stdout.writeln("  ${board[2][0]}   |  ${board[2][1]}   |  ${board[2][2]}   ");
  stdout.writeln("      |      |      ");
}

void player() {
  if (turn == 'X') {
    stdout.write("Player - 1 [X] turn: ");
  } else if (turn == 'O') {
    stdout.write("Player - 2 [O] turn: ");
  }
  choice = int.parse((stdin.readLineSync())!);
  switch (choice) {
    case 1:
    //raw and col are variable names not in the array
      row = 0;
      column = 0;
      break;
    case 2:
      row = 0;
      column = 1;
      break;
    case 3:
      row = 0;
      column = 2;
      break;
    case 4:
      row = 1;
      column = 0;
      break;
    case 5:
      row = 1;
      column = 1;
      break;
    case 6:
      row = 1;
      column = 2;
      break;
    case 7:
      row = 2;
      column = 0;
      break;
    case 8:
      row = 2;
      column = 1;
      break;
    case 9:
      row = 2;
      column = 2;
      break;
    default:
      stdout.writeln("Invalid Move");
  }
  //switch turn and place 
  if (board[row!][column!] != 'X' && board[row!][column!] != 'O') {
    if (turn == 'X') {
      board[row!][column!] = 'X';
      turn = 'O';
    } else {
      board[row!][column!] = 'O';
      turn = 'X';
    }
  } else {
    //if input position already filled
    stdout.writeln("Box already filled! Please choose another!\n");
    player();
  }
  print("\x1B[2J\x1B[0;0H");
  drawing();
}
bool gameover(){

    for(int i=0; i<3; i++)
    if(board[i][0] == board[i][1] && board[i][0] == board[i][2] || board[0][i] == board[1][i] && board[0][i] == board[2][i])
    return false;

    //checking the win for both diagonal

    if(board[0][0] == board[1][1] && board[0][0] == board[2][2] || board[0][2] == board[1][1] && board[0][2] == board[2][0])
    return false;

    //Checking the game is in continue mode or not
    for(int i=0; i<3; i++)
    for(int j=0; j<3; j++)
    if(board[i][j] != 'X' && board[i][j] != 'O')
    return true;

    //Checking the if game already draw
    draw = true;
    return false;
}
void checke_res(){if(turn == 'X' && draw == false){
        print("nnCongratulations!Player with 'O' has won the game");
    }
    else if(turn == 'O' && draw == false){
        print("nnCongratulations!Player with 'X' has won the game");
    }
    else
    print("nnGAME DRAW!!!nn");}
void main() {
  print("tttT I C K -- T A C -- T O E -- G A M E BY MINATO ISMAIEL ttt");
  while (gameover()) {drawing();player();gameover();}
checke_res();
  }
  