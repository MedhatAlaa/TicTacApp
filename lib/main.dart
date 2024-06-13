import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/tic_tac_game/home_screen.dart';
import 'package:tic_tac/tic_tac_game/provider.dart';
import 'package:tic_tac/tic_tac_game/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
  );
  runApp(
      ChangeNotifierProvider<MyProvider>(
        create: (BuildContext context)=>MyProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider
          .of<MyProvider>(context)
          .tm,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const TicTacHomeScreen(),
    );
  }
}
