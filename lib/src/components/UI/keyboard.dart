import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/key.dart';
import 'package:pianogame/src/config.dart';

class Keyboard extends RectangleComponent {
  Function activateKey;
  Function getVolume;
  Keyboard({required this.activateKey, required this.getVolume})
  :super(
    anchor: Anchor.center,
    // position: Vector2(
    //   -keyboardWidth/2,
    //   gameHeight/2 - keyboardHeight - (gameWidth/2-keyboardWidth/2)),
    // size: Vector2(keyboardWidth, keyboardHeight),
    paint: Paint()..color = backColor,
  );

  void updateFromParameters() {

  }

  @override
  FutureOr<void> onLoad() {
    for (int i=0; i<noteList.length; i++){
      PianoKey pianoKey = PianoKey(
        note: noteList[i],
        activation: activateKey,
        getVolume: getVolume);
      add(pianoKey);
    }


    return super.onLoad();
  }
}