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
  late TextComponent scoreIndicator;
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

    scoreIndicator = TextComponent(text: "$score %", anchor: Anchor.center);
    add(scoreIndicator);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    gamescoreWidth = newSize.x * magicPadding;
    gamescoreHeight = newSize.y * magicPadding / magicDivision ;

    position = Vector2(
      -gamescoreWidth/2,
      -newSize.y / magicDivision - gamescoreHeight / 2
      );
    size = Vector2(
      gamescoreWidth,
      gamescoreHeight);

    final TextStyle textStyle = TextStyle(
      fontSize: gamescoreHeight/3,
      color: score > 66 ? Colors.green : score > 33 ? Colors.yellow : Colors.red
    );
    final textPaint = TextPaint(style: textStyle);
    scoreIndicator.textRenderer = textPaint;
    scoreIndicator.position = Vector2(gamescoreWidth/2, gamescoreHeight/2);

    super.onGameResize(newSize);
  }
}