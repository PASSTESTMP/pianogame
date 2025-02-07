import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/painting.dart';
import 'package:pianogame/src/config.dart';

class FloatingButton extends CircleComponent with TapCallbacks, HasGameRef {
  Function onPressed;
  late TextComponent tekstSkip;
  FloatingButton(this.onPressed):super();

  @override
  Future<void> onLoad() {
    paint.color = transparent;
    anchor = Anchor.topCenter;
    tekstSkip = TextComponent(text: "Skip", anchor: Anchor.center);
    add(tekstSkip);
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    radius = gameRef.size.y * (1-1/magicDivision) / 4;
    final newFontSize = radius/2;
    tekstSkip.textRenderer = TextPaint(
      style: TextStyle(
        fontSize: newFontSize,
      )
    );
    tekstSkip.position = Vector2(radius, radius);
    super.onGameResize(newSize);
  }

  @override
  void onTapDown(TapDownEvent event) {
    onPressed();
    super.onTapDown(event);
  }
}