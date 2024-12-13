import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Tempo extends RectangleComponent {
  Function changeTempo;
  Tempo({required this.changeTempo})
  :super(
    paint: Paint()..color = transparent,
    size: Vector2(tempoWidth, tempoHeight),
    position: Vector2(0, (keyboardHeight - 3*(gameWidth/2-keyboardWidth/2))/2 - tempoHeight/2)
  );

}