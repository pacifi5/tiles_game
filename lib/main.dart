import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiles_game/Griglia.dart';
import 'package:tiles_game/PlayerRectangle.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Griglia(),
            ),
            Expanded(
              child: Playerrectangle(),
            ),
          ],
        ),
      ),
    );
  }
}
