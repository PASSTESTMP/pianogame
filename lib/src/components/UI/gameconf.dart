import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/UIdefaults/dropdown.dart';
import 'package:pianogame/src/components/components.dart';
import 'package:pianogame/src/config.dart';

class Gameconf extends RectangleComponent {
  Function startGame;
  Function changeTempo;
  Function changeNumberOfNotes;
  Gameconf({
    required this.startGame,
    required this.changeTempo,
    required this.changeNumberOfNotes})
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );

  int tempo = 120;
  int noteNumber = 6;

  Volume volumeSlider = Volume();

  

  

  @override
  FutureOr<void> onLoad() {

    DropDown tempoSelector = DropDown(
      actVal: tempo.toString(),
      values: tempoValues,
      position: Vector2(100, 100),
      size: Vector2(100, 100),
      changeFunction: changeTempo);

    DropDown notesSelector = DropDown(
      actVal: noteNumber.toString(),
      values: numberOfNotesValues,
      position: Vector2(300, 100),
      size: Vector2(100, 100),
      changeFunction: changeNumberOfNotes);


    Buttonstart start = Buttonstart(startGame: startGame);

    add(volumeSlider);
    add(tempoSelector);
    add(notesSelector);
    add(start);


    return super.onLoad();
  }
}