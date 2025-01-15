import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/key.dart';
import 'package:pianogame/src/config.dart';

class Keyboard extends RectangleComponent {
  Function activateKey;
  Function getVolume;
  double keyboardWidth = defaultKeyboardWidth;
  double keyboardHeight = defaultKeyboardHeight;
  int numberOfWhiteKeys = 12;
  Keyboard({required this.activateKey, required this.getVolume})
  :super(
    paint: Paint()..color = backColor,
    anchor: Anchor.center,
  );



  @override
  FutureOr<void> onLoad() {
    for (int i=0; i<numberOfWhiteKeys && i<noteList.length; i++){
      PianoKey pianoKey = PianoKey(
        note: noteList[i],
        activation: activateKey,
        getVolume: getVolume,
        numberOfWhiteKeys: numberOfWhiteKeys);
      add(pianoKey);
    }
    for (int i=14; i<14+numberOfWhiteKeys*5/8 && i<noteList.length; i++){
      PianoKey pianoKey = PianoKey(
        note: noteList[i],
        activation: activateKey,
        getVolume: getVolume,
        numberOfWhiteKeys: numberOfWhiteKeys);
      add(pianoKey);
    }

    position = Vector2(
      0,
      0);
    size = Vector2(
      keyboardWidth,
      keyboardHeight);


    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    keyboardWidth = newSize.x * magicPadding;
    keyboardHeight = newSize.y * magicPadding * (1 - 1/magicDivision);

    position = Vector2(
      0,
      keyboardHeight / 4);
    size = Vector2(
      keyboardWidth,
      keyboardHeight);

    super.onGameResize(newSize);
  }
}