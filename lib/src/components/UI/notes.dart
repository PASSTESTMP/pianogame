import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Notes extends RectangleComponent {
  Notes()
  :super(
    paint: Paint()..color = transparent,
    size: Vector2(notesWidth, notesHeight),
    position: Vector2(-whiteKeyWidth*2, -gameHeight/4-notesHeight/2)
  );

}