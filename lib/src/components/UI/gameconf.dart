import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/UIdefaults/dropdown.dart';
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

  int tempo = 120;

  Volume volumeSlider = Volume();
  Tempo tempoSelector = Tempo();
  Notes notesSelector = Notes();

  

  

  @override
  FutureOr<void> onLoad() {

    DropDown dd = DropDown(
      actVal: tempo.toString(),
      values: tempoValues,
      position: Vector2(100, 100),
      size: Vector2(100, 100));

    Buttonstart start = Buttonstart(startGame: startGame);

    add(volumeSlider);
    add(tempoSelector);
    add(notesSelector);
    add(start);
    add(dd);


    return super.onLoad();
  }
}