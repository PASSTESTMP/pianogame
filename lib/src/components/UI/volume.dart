import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Volume extends RectangleComponent with DragCallbacks, TapCallbacks{
  double outVolume;
  Function changeVolume;
  double sliderWidth = defaultSliderWidth;
  double slidertHeight = defaultSliderWidth;
  Volume({required this.changeVolume, this.outVolume=defaultVomule}):super(
    paint: Paint()..color = transparent,
    anchor: Anchor.center,
  );

  double volume = defaultVomule; // Początkowa głośność

  // Wskaźnik pozycji
  late RectangleComponent _sliderRect;
  late RectangleComponent _knobRect;

  @override
  Future<void> onLoad() async {
    _sliderRect = RectangleComponent(position: Vector2(0, 0), size: Vector2(defaultSliderWidth, sliderHeight));
    _knobRect = RectangleComponent(paint: (Paint()..color= blackKey), position: Vector2(volume * defaultSliderWidth - 10, -10), size: Vector2(20, 40));
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
    double relativeX = (x).clamp(0, defaultSliderWidth);
    volume = relativeX / defaultSliderWidth;
    _updateSlider();
  }

  // Aktualizuje pozycje prostokątów (paska i wskaźnika)
  void _updateSlider() {
    _knobRect.position.x =volume * defaultSliderWidth - 10;
    // RectangleComponent _knobRect = Rect.fromLTWH(position.x + volume * defaultSliderWidth - 10, position.y - 10, 20, 40);
    
    
    
  }

  @override
  void onGameResize(Vector2 newSize) {
    sliderWidth = newSize.x * 0.9 / 5;
    slidertHeight = newSize.y * 0.9 / 50;

    position = Vector2(
      sliderWidth,
      -newSize.y * 4 / 9);
    size = Vector2(
      sliderWidth,
      slidertHeight);

    super.onGameResize(newSize);
  }

}