import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Gamescore extends RectangleComponent with TapCallbacks{
  int score;
  Function restart;
  double gamescoreWidth = 0;
  double gamescoreHeight = 0;
  Gamescore({required this.score, required this.restart})
  :super(
    // position: Vector2(
    //   -keyboardWidth/2,
    //   -gameHeight/2 + (gameWidth/2-keyboardWidth/2)),
    // size: Vector2(keyboardWidth, keyboardHeight - 3*(gameWidth/2-keyboardWidth/2)),
    paint: Paint()..color = backColor,
  );

  @override
  void onTapDown(TapDownEvent event) {
    restart();
    super.onTapDown(event);
  }
  

  @override
  FutureOr<void> onLoad() {
    // add(volumeSlider);

    TextComponent scoreIndicator = TextComponent(text: score.toString());
    add(scoreIndicator);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    gamescoreWidth = newSize.x * 0.9;
    gamescoreHeight = newSize.y / 2 * 0.9;

    position = Vector2(
      -gamescoreWidth/2,
      -newSize.y / 4 - gamescoreHeight/2);
    size = Vector2(
      gamescoreWidth,
      gamescoreHeight);

    super.onGameResize(newSize);
  }
}