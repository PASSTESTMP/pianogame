import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Volume extends RectangleComponent {
  double outVolume;
  Volume({this.outVolume=defaultVomule}):super(
    paint: Paint()..color = transparent,
    size: Vector2(sliderWidth, sliderHeight),
    position: Vector2(keyboardWidth * 3 / 7 / 2, -gameHeight/4-sliderHeight/2)
  );



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