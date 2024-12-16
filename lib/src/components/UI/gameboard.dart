import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/parameters/dynamic_parameters.dart';
import 'package:pianogame/src/config.dart';

class Gameboard extends RectangleComponent {
  int numberOfNotes;
  int actualNumber = 0;
  DynamicParameters dynamicParameters;
  Gameboard({required this.numberOfNotes, required this.dynamicParameters})
  :super(
    anchor: Anchor.center,
    paint: Paint()..color = backColor,
  );


  void showUsedNote(String note, bool correctNote){
    NoteIndicator noteIndicator = NoteIndicator(
      note: note,
      number: actualNumber,
      numberOfNotes: numberOfNotes,
      correct: correctNote);
    add(noteIndicator);
    actualNumber++;
  }

  void updateFromParameters(){
    position = Vector2(dynamicParameters.gameboardX, dynamicParameters.gameboardY);
    size = Vector2(dynamicParameters.gameboardWidth, dynamicParameters.gameboardHeight);
  }

  @override
  FutureOr<void> onLoad() {
    position = Vector2(dynamicParameters.gameboardX, dynamicParameters.gameboardY);
    size = Vector2(dynamicParameters.gameboardWidth, dynamicParameters.gameboardHeight);

    for(int i=0; i<numberOfNotes; i++){
      RectangleComponent emptySpace = RectangleComponent(
        size: Vector2(keyboardWidth/2/numberOfNotes, spaceHeight),
        position: Vector2(2*i*keyboardWidth/2/numberOfNotes + keyboardWidth/2/numberOfNotes/2, keyboardHeight/2)
      );

      add(emptySpace);
    }
    

    return super.onLoad();
  }
}

class NoteIndicator extends TextComponent {
  String note;
  int number;
  int numberOfNotes;
  bool correct;
  NoteIndicator({
    required this.note,
    required this.number,
    required this.numberOfNotes,
    required this.correct
    }):super();

  @override
  FutureOr<void> onLoad() {
    text = note;
    size = Vector2(keyboardWidth/2/numberOfNotes, keyboardWidth/2/numberOfNotes);
    position = Vector2(
      2*number*keyboardWidth/2/numberOfNotes + keyboardWidth/2/numberOfNotes/2,
      keyboardHeight/2 - keyboardWidth/2/numberOfNotes
    );
    final textStyle = TextStyle(
      color: correct ? Colors.green : Colors.red, // Kolor czcionki
      fontSize: keyboardWidth/2/numberOfNotes*0.8,      // Rozmiar czcionki
    );

    final textPaint = TextPaint(style: textStyle);
    textRenderer = textPaint;
    return super.onLoad();
  }

}