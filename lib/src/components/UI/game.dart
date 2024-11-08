import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Gameboard extends RectangleComponent {
  int numberOfNotes;
  Gameboard({required this.numberOfNotes})
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );

  
  

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