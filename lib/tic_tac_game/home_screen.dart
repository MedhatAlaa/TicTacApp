import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/tic_tac_game/game_screen.dart';
import 'package:tic_tac/tic_tac_game/provider.dart';

class TicTacHomeScreen extends StatefulWidget {
  const TicTacHomeScreen({Key? key}) : super(key: key);

  @override
  State<TicTacHomeScreen> createState() => _TicTacHomeScreenState();
}

class _TicTacHomeScreenState extends State<TicTacHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (BuildContext context) => MyProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...fullBlock(),
            ],
          ),
          ),
        ),
      );
  }
  List<Widget> fullBlock()
  {
    return
      [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: SizedBox(
            height: 300.0,
            width: double.infinity,
            child: Image.asset(
              'lib/assets/images/images.jfif',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 50.0),
        Text(
          'Go to play',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 20.0),
        Container(
          width: 170.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            // color: Colors.blue,
            color: Theme.of(context).primaryColor,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const GameLogicScreen(),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: const Text(
              'Enjoy!',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          'Change the theme',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Light',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 15.0),
            Switch.adaptive(
              activeColor: Theme.of(context).primaryColor,
              inactiveThumbColor: Theme.of(context).primaryColor,
              activeTrackColor:Theme.of(context).primaryColor,
              value: Provider.of<MyProvider>(context).isSwitched,
              onChanged: (newValue) =>
                  Provider.of<MyProvider>(context, listen: false)
                      .themeMode(newValue),
            ),
            const SizedBox(width: 15.0),
            Text(
              'Dark',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 15.0),
          ],
        ),
      ];
  }
}
