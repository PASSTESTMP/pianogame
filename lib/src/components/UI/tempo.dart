import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Tempo extends RectangleComponent {
  Tempo()
  :super(
    paint: Paint()..color = transparent,
    size: Vector2(tempoWidth, tempoHeight),
    position: Vector2(-keyboardWidth/2, -gameHeight/4-tempoHeight/2)
  );

}