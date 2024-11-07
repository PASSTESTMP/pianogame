import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'src/pianogame.dart';

void main() {
  final game = PianoGame();                                  // Modify this line
  runApp(GameWidget(game: game));
}