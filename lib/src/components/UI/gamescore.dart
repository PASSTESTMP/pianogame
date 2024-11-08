import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/components.dart';
import 'package:pianogame/src/config.dart';

class Gamescore extends RectangleComponent {
  Gamescore()
  :super(
    position: Vector2(
      -keyboardWidth/2,
      -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );

  

  @override
  FutureOr<void> onLoad() {
    // add(volumeSlider);


    return super.onLoad();
  }
}