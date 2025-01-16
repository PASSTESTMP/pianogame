import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/pianogame.dart';

void main() {
  final game = PianoGame();                                  // Modify this line

  WidgetsFlutterBinding.ensureInitialized();
  
  // Wymuszenie orientacji horyzontalnej
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(GameWidget(game: game));
  });
}