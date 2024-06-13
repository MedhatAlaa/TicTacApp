import 'package:flutter/material.dart';
import 'package:tic_tac/tic_tac_game/logic_screen.dart';

class GameLogicScreen extends StatefulWidget {
  const GameLogicScreen({Key? key}) : super(key: key);

  @override
  State<GameLogicScreen> createState() => _GameLogicScreenState();
}

class _GameLogicScreenState extends State<GameLogicScreen> {
  bool isSwitch = false;
  bool gameOver = false;
  String activePlayer = 'X';
  String result = '';
  int turn = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: [
                    ...firstBlock(),
                    buildExpanded(context),
                    ...lastBlock(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...firstBlock(),
                          ...lastBlock(),
                        ],
                      ),
                    ),
                    buildExpanded(context),
                  ],
                ),
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1,
        children: List.generate(
          9,
          (index) => InkWell(
            onTap: () => gameOver ? null : _onTap(index),
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).hintColor,
              ),
              child: Center(
                child: Text(
                  Player.playerX.contains(index)
                      ? 'X'
                      : Player.playerO.contains(index)
                          ? 'O'
                          : '',
                  style: TextStyle(
                    color: Player.playerX.contains(index)
                        ? Theme.of(context).cardColor
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTap(index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      Game.playGame(index, activePlayer);
      updateState();
      if (!isSwitch && !gameOver && turn != 9) {
        await Game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = Game.checkWinner();
      if (winnerPlayer != '') {
        gameOver = true;
        result = '$winnerPlayer is the winner';
      } else {
        result = 'it\'s draw';
      }
    });
  }

  List<Widget> firstBlock() {
    return [
      SwitchListTile.adaptive(
        activeColor: Theme.of(context).primaryColor,
        inactiveThumbColor: Theme.of(context).primaryColor,
        activeTrackColor: Theme.of(context).primaryColor,
        inactiveTrackColor: Theme.of(context).shadowColor,
        value: isSwitch,
        onChanged: (val) {
          setState(() {
            isSwitch = val;
          });
        },
        title: Text(
          'turn on/off two players',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        'it\'s $activePlayer turn'.toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      const SizedBox(
        height: 15.0,
      ),
    ];
  }

  List<Widget> lastBlock() {
    return [
      Text(
        result.toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(
        height: 10.0,
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            Player.playerX = [];
            Player.playerO = [];
            activePlayer = 'X';
            result = '';
            gameOver = false;
          });
        },
        icon: const Icon(Icons.replay),
        label: const Text('Repeat the game'),
      ),
    ];
  }
}
