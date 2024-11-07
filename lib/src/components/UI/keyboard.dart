import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/key.dart';
import 'package:pianogame/src/config.dart';

class Keyboard extends RectangleComponent {
  Keyboard()
  :super(
    position: Vector2(
      -keyboardWidth/2,
      gameHeight/2 - keyboardHeight - (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight),
    paint: Paint()..color = backColor,
  );

  

  @override
  FutureOr<void> onLoad() {
    for (int i=0; i<noteList.length; i++){
      PianoKey pianoKey = PianoKey(note: noteList[i]);
      add(pianoKey);
    }


    return super.onLoad();
  }
}