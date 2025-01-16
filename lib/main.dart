import 'dart:io';

import 'package:window_size/window_size.dart';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/pianogame.dart';

void main() {
  final game = PianoGame();                                  // Modify this line

  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('The Piano Game 1 2 3'); // Opcjonalne ustawienie tytułu
    setWindowMinSize(const Size(800, 300));   // Minimalny rozmiar
  }

  // Wymuszenie orientacji horyzontalnej
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(GameWidget(game: game));
  });
}