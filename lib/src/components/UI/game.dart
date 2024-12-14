import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Gameboard extends RectangleComponent {
  int numberOfNotes;
  int actualNumber = 0;
  Gameboard({required this.numberOfNotes})
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
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

  
  

  @override
  FutureOr<void> onLoad() {
    for(int i=0; i<=numberOfNotes; i++){
      RectangleComponent emptySpace = RectangleComponent(
        size: Vector2(keyboardWidth/2/numberOfNotes, spaceHeight),
        position: Vector2(i*keyboardWidth/2/numberOfNotes*3/2 + keyboardWidth/2/numberOfNotes, keyboardHeight/2)
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
      number*keyboardWidth/2/numberOfNotes*3/2 + keyboardWidth/2/numberOfNotes,
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