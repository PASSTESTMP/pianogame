import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Gameboard extends RectangleComponent {
  int numberOfNotes;
  List emptySpaces = [];
  int actualNumber = 0;
  double gameboardWidth = 0;
  double gameboardHeight = 0;
  Gameboard({required this.numberOfNotes})
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

  void addSpace(var item){
    add(item);
  }

  @override
  FutureOr<void> onLoad() {
    for(int i=0; i<numberOfNotes; i++){
      RectangleComponent emptySpace = RectangleComponent(
      );

      emptySpaces.add(emptySpace);
    }

    emptySpaces.forEach(addSpace);
    

    return super.onLoad();
  }
  
  @override
  void onGameResize(Vector2 newSize) {
    gameboardWidth = newSize.x * 0.9;
    gameboardHeight = newSize.y / 2 * 0.9;

    position = Vector2(
      0,
      -newSize.y / 4);
    size = Vector2(
      gameboardWidth,
      gameboardHeight);
    
    void resizeSpace(var item){
      int i = emptySpaces.indexOf(item);
      item.size = Vector2(gameboardWidth/2/numberOfNotes, spaceHeight);
      item.position = Vector2(2*i*gameboardWidth/2/numberOfNotes + gameboardWidth/2/numberOfNotes/2, gameboardHeight/2);
    }

    emptySpaces.forEach(resizeSpace);

    super.onGameResize(newSize);
  }
}

class NoteIndicator extends TextComponent {
  String note;
  int number;
  int numberOfNotes;
  bool correct;
  late TextStyle textStyle;
  NoteIndicator({
    required this.note,
    required this.number,
    required this.numberOfNotes,
    required this.correct
    }):super();

  @override
  FutureOr<void> onLoad() {
    text = note;
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    size = Vector2(newSize.x * 0.9/2/numberOfNotes, newSize.x * 0.9/2/numberOfNotes);
    position = Vector2(
       2*number*newSize.x * 0.9/2/numberOfNotes + newSize.x * 0.9/2/numberOfNotes/2,
       newSize.y / 2 * 0.9/2 - newSize.x * 0.9/2/numberOfNotes
     );

    textStyle = TextStyle(
      color: correct ? Colors.green : Colors.red, // Kolor czcionki
      fontSize: newSize.x * 0.9/2/numberOfNotes*0.8,      // Rozmiar czcionki
    );
    final textPaint = TextPaint(style: textStyle);
    textRenderer = textPaint;
      
    super.onGameResize(newSize);
  }

}