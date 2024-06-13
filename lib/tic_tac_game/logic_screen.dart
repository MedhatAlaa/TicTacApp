import 'dart:math';

class Player {
  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool containsAll(x, y, z) {
    return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  static void playGame(index, activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  static Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];

    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }
    Random random = Random();
    int randomIndex = random.nextInt(emptyCells.length);
    index = emptyCells[randomIndex];
    playGame(index, activePlayer);
  }

  static String checkWinner() {
    String winner = '';
    if ((Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6))) {
      winner = 'X';
    }
   else if ((Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6))) {
      winner = 'O';
    }
   else
   {
     winner='';
   }

    return winner;
  }
}
