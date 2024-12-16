import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/parameters/dynamic_parameters.dart';
import 'package:pianogame/src/config.dart';

class Buttonstart extends RectangleComponent with TapCallbacks {
  Function startGame;
  DynamicParameters dynamicParameters;
  Buttonstart({required this.startGame, required this.dynamicParameters}):super(
    paint: Paint()..color = transparent,
    anchor: Anchor.center,
    );

  TextComponent startButton = TextComponent(text: "START");
  
  @override
  void onTapDown(TapDownEvent event) {
    startGame();
    super.onTapDown(event);
  }

  @override
  FutureOr<void> onLoad() {
    size = Vector2(dynamicParameters.startButtonWidth, dynamicParameters.startButtonWidth);
    position = Vector2(dynamicParameters.startButtonX, dynamicParameters.startButtonY);
    add(startButton);
    return super.onLoad();
  }

}