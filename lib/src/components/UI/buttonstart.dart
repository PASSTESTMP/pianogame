import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Buttonstart extends RectangleComponent with TapCallbacks {
  Function startGame;
  Buttonstart({required this.startGame}):super(
    paint: Paint()..color = transparent,
    size: Vector2(sliderWidth, sliderHeight),
    position: Vector2(10*whiteKeyWidth, (keyboardHeight - 3*(gameWidth/2-keyboardWidth/2))/2)
  );



  TextComponent startButton = TextComponent(text: "START");
  

  @override
  void onTapDown(TapDownEvent event) {
    startGame();
    super.onTapDown(event);
  }

  @override
  FutureOr<void> onLoad() {
    add(startButton);
    return super.onLoad();
  }



  // Volume({required this.inVolume}):super(
  //   value: inVolume,
  //   min: 0.0,
  //   max: 1.0,
  //   onChanged: (value) {
  //     var outVolume = value;
  //     FlameAudio.bgm.(outVolume);

  //   },
  // );

}