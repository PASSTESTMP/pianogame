import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Buttonstart extends RectangleComponent with TapCallbacks {
  Function startGame;
  double buttonStartWidth = defaultButtonStartWidth;
  double buttonStartHeight = defaultButtonStartHeight;
  Buttonstart({required this.startGame}):super(
    paint: Paint()..color = transparent,
    anchor: Anchor.center,
  );

  TextComponent startButton = TextComponent(text: "START", anchor: Anchor.center);

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

  @override
  void onGameResize(Vector2 newSize) {
    if(newSize.x * 0.9 /3 > newSize.y * 0.9 / 4){
      buttonStartWidth = newSize.y * 0.9 / 4;
      buttonStartHeight = buttonStartWidth;
    }else{
      buttonStartWidth = newSize.x * 0.9 /3;
      buttonStartHeight = buttonStartWidth;
    }
    

    position = Vector2(
      newSize.x * 0.9 / 2,
      newSize.y * 0.9 / 4);
    size = Vector2(
      buttonStartWidth,
      buttonStartHeight);

    startButton.position = Vector2(
      buttonStartWidth/2,
      buttonStartHeight/2
    );

    super.onGameResize(newSize);
  }



}