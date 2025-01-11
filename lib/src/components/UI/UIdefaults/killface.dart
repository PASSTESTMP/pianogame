import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Killface extends RectangleComponent with TapCallbacks{
  Function killFunction;
  Killface({required this.killFunction}):super(paint: Paint()..color = transparent);

  @override
  FutureOr<void> onLoad() {
    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 newSize) {
    size.x = 4*newSize.x;
    size.y = 4*newSize.y;
    super.onGameResize(newSize);
  }

  @override
  void onTapDown(TapDownEvent event) {
    killFunction();
    super.onTapDown(event);
  }
}