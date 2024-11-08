import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/components.dart';
import 'package:pianogame/src/config.dart';

class Gameconf extends RectangleComponent {
  Function startGame;
  Gameconf({required this.startGame})
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );

  Volume volumeSlider = Volume();
  Tempo tempoSelector = Tempo();
  Notes notesSelector = Notes();

  

  @override
  FutureOr<void> onLoad() {


    Buttonstart start = Buttonstart(startGame: startGame);

    add(volumeSlider);
    add(tempoSelector);
    add(notesSelector);
    add(start);


    return super.onLoad();
  }
}