import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/UIdefaults/dropdown.dart';
import 'package:pianogame/src/components/components.dart';
import 'package:pianogame/src/components/parameters/dynamic_parameters.dart';
import 'package:pianogame/src/config.dart';

class Gameconf extends RectangleComponent {
  Function startGame;
  Function changeTempo;
  Function changeNumberOfNotes;
  Function changeVolume;
  DynamicParameters dynamicParameters;
  Gameconf({
    required this.startGame,
    required this.changeTempo,
    required this.changeNumberOfNotes,
    required this.changeVolume,
    required this.dynamicParameters})
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );

  int tempo = 120;
  int noteNumber = 6;

  @override
  FutureOr<void> onLoad() {


    Volume volumeSlider = Volume(changeVolume: changeVolume);

    DropDown tempoSelector = DropDown(
      parameterName: "TEMPO",
      actVal: tempo.toString(),
      values: tempoValues,
      position: Vector2(100, 100),
      size: Vector2(100, 100),
      changeFunction: changeTempo);

    DropDown notesSelector = DropDown(
      parameterName: "NUMBER OF NOTES",
      actVal: noteNumber.toString(),
      values: numberOfNotesValues,
      position: Vector2(300, 100),
      size: Vector2(100, 100),
      changeFunction: changeNumberOfNotes);


    Buttonstart start = Buttonstart(startGame: startGame, dynamicParameters:dynamicParameters);

    add(volumeSlider);
    add(tempoSelector);
    add(notesSelector);
    add(start);


    return super.onLoad();
  }
}