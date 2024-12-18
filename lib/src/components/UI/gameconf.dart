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
  double gameconfWidth = 0;
  double gameconfHeight = 0;
  Gameconf({
    required this.startGame,
    required this.changeTempo,
    required this.changeNumberOfNotes})
  :super(
    paint: Paint()..color = backColor,
    anchor: Anchor.center,
  );

  int tempo = 120;
  int noteNumber = 6;

  @override
  FutureOr<void> onLoad() {

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


    Buttonstart start = Buttonstart(startGame: startGame);

    add(tempoSelector);
    add(notesSelector);
    add(start);


    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    gameconfWidth = newSize.x * 0.9;
    gameconfHeight = newSize.y / 2 * 0.9;

    position = Vector2(
      0,
      -newSize.y / 4);
    size = Vector2(
      gameconfWidth,
      gameconfHeight);

    super.onGameResize(newSize);
  }
}