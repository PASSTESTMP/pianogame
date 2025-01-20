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
  SpriteComponent tempoIconComponent = SpriteComponent();
  late DropDown tempoSelector;
  late DropDown notesSelector;
  Gameconf({
    required this.startGame,
    required this.changeTempo,
    required this.changeNumberOfNotes})
  :super(
    paint: Paint()..color = backColor,
    anchor: Anchor.center,
  ){
    tempoSelector = DropDown(
      parameterName: " =",
      actVal: tempo.toString(),
      values: tempoValues,
      position: Vector2(100, 100),
      size: Vector2(100, 100),
      changeFunction: changeTempo);

    notesSelector = DropDown(
      parameterName: "n =",
      actVal: noteNumber.toString(),
      values: numberOfNotesValues,
      position: Vector2(300, 100),
      size: Vector2(100, 100),
      changeFunction: changeNumberOfNotes);
  }

  int tempo = 120;
  int noteNumber = 6;

  @override
  FutureOr<void> onLoad() async {

    final tempoIcon = await Sprite.load('note.png');

    tempoIconComponent.sprite = tempoIcon;


    Buttonstart start = Buttonstart(startGame: startGame);

    add(tempoIconComponent);

    add(tempoSelector);
    add(notesSelector);
    add(start);


    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    gameconfWidth = newSize.x * magicPadding;
    gameconfHeight = newSize.y / magicDivision * magicPadding;

    position = Vector2(
      0,
      - newSize.y / magicDivision);
    size = Vector2(
      gameconfWidth,
      gameconfHeight);

    double selectorWidth;
    double selectorHeight;

    if(gameconfWidth / 3 > gameconfHeight / 2){
      selectorWidth = gameconfHeight / 2;
      selectorHeight = selectorWidth;
    }else{
      selectorWidth = gameconfWidth / 3;
      selectorHeight = selectorWidth;
    }

    double notesSelectorX = gameconfWidth - (gameconfWidth / 2 - selectorWidth/2)/ 2 - selectorWidth/2;
    double notesSelectorY = gameconfHeight / 2 - selectorHeight/2;

    double tempoSelectorX = (gameconfWidth / 2 - selectorWidth/2)/ 2 - selectorWidth/2;
    double tempoSelectorY = gameconfHeight / 2 - selectorHeight/2;

    tempoSelector.size = Vector2(selectorWidth, selectorHeight);
    tempoSelector.position = Vector2(tempoSelectorX, tempoSelectorY);

    notesSelector.size = Vector2(selectorWidth, selectorHeight);
    notesSelector.position = Vector2(notesSelectorX, notesSelectorY);
    

    tempoIconComponent.size = Vector2(selectorWidth/2, selectorHeight/2);
    tempoIconComponent.position = Vector2(
      tempoSelectorX - selectorWidth/2,
      tempoIconComponent.size.y+selectorHeight/4
      );

    // position = Vector2(
    //   newSize.x * 0.9 / 2,
    //   newSize.y * 0.9 / 4);


    super.onGameResize(newSize);
  }
}