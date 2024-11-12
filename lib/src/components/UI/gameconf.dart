import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/components.dart';
import 'package:pianogame/src/config.dart';

class Gameconf extends RectangleComponent {
  Function startGame;
  Function changeVolume;
  Gameconf({required this.startGame, required this.changeVolume})
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );



  

  @override
  FutureOr<void> onLoad() {

    Volume volumeSlider = Volume(changeVolume: changeVolume);
    Tempo tempoSelector = Tempo();
    Notes notesSelector = Notes();
    Buttonstart start = Buttonstart(startGame: startGame);

    add(volumeSlider);
    add(tempoSelector);
    add(notesSelector);
    add(start);


    return super.onLoad();
  }
}