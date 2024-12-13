import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Volume extends RectangleComponent with DragCallbacks, TapCallbacks{
  double outVolume;
  Function changeVolume;
  Volume({required this.changeVolume, this.outVolume=defaultVomule}):super(
    paint: Paint()..color = transparent,
    size: Vector2(sliderWidth, sliderHeight),
    position: Vector2(10*whiteKeyWidth, (keyboardHeight - 3*(gameWidth/2-keyboardWidth/2))/2 - sliderHeight*4/2)
  );

  double volume = defaultVomule; // Początkowa głośność

  // Wskaźnik pozycji
  late RectangleComponent _sliderRect;
  late RectangleComponent _knobRect;

  @override
  Future<void> onLoad() async {
    _sliderRect = RectangleComponent(position: Vector2(0, 0), size: Vector2(sliderWidth, sliderHeight));
    _knobRect = RectangleComponent(paint: (Paint()..color= blackKey), position: Vector2(volume * sliderWidth - 10, -10), size: Vector2(20, 40));
    _updateSlider();
    add(_sliderRect);
    add(_knobRect);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _updateVolume(event.localPosition.x);
    changeVolume(volume);
    super.onTapDown(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    _updateVolume(event.localEndPosition.x);
    changeVolume(volume);
    super.onDragUpdate(event);
  }

  // Funkcja do aktualizacji głośności na podstawie położenia wskaźnika
  void _updateVolume(double x) {
    double relativeX = (x).clamp(0, sliderWidth);
    volume = relativeX / sliderWidth;
    _updateSlider();
  }

  // Aktualizuje pozycje prostokątów (paska i wskaźnika)
  void _updateSlider() {
    _knobRect.position.x =volume * sliderWidth - 10;
    // RectangleComponent _knobRect = Rect.fromLTWH(position.x + volume * sliderWidth - 10, position.y - 10, 20, 40);
    
    
    
  }



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