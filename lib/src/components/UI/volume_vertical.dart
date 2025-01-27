import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Volume extends RectangleComponent with DragCallbacks, TapCallbacks{
  double outVolume;
  Function changeVolume;
  double sliderWidth = defaultSliderWidth;
  double slidertHeight = defaultSliderWidth;
  SpriteComponent volumeIconComponent = SpriteComponent();
  Volume({required this.changeVolume, this.outVolume=defaultVomule}):super(
    paint: Paint()..color = transparent,
    anchor: Anchor.center,
  );

  double volume = defaultVomule; // Początkowa głośność

  // Wskaźnik pozycji
  late RectangleComponent _sliderRect;
  late RectangleComponent _knobRect;
  // late RectangleComponent _icon;

  @override
  Future<void> onLoad() async {
    _sliderRect = RectangleComponent();
    _knobRect = RectangleComponent(paint: (Paint()..color= blackKey), anchor: Anchor.center);
    // _icon = RectangleComponent();

    final volumeIcon = await Sprite.load('volume.png');

    volumeIconComponent.sprite = volumeIcon;

    _updateSlider();
    add(_sliderRect);
    add(_knobRect);
    add(volumeIconComponent);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _updateVolume(event.localPosition.y);
    changeVolume(volume);
    super.onTapDown(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    _updateVolume(event.localEndPosition.y);
    changeVolume(volume);
    super.onDragUpdate(event);
  }

  // Funkcja do aktualizacji głośności na podstawie położenia wskaźnika
  void _updateVolume(double y) {
    double relativeY = (y).clamp(0, sliderHeight);
    volume = relativeY / sliderHeight;
    _updateSlider();
  }

  // Aktualizuje pozycje prostokątów (paska i wskaźnika)
  void _updateSlider() {
    if(volume * sliderHeight < _knobRect.size.y/2){
      _knobRect.position.y = _knobRect.size.y/2;
    }else if(volume * sliderHeight > sliderHeight - _knobRect.size.y/2){
      _knobRect.position.y = sliderHeight - _knobRect.size.y/2;
    }else{
      _knobRect.position.y = volume * sliderHeight;
    }
    }

  @override
  void onGameResize(Vector2 newSize) {
    sliderWidth = newSize.x * magicPadding / 50;
    slidertHeight = newSize.y * magicPadding / 5;

    position = Vector2(
      sliderWidth,
      -newSize.y * 4 / 9);
    size = Vector2(
      sliderWidth,
      slidertHeight*3);

    _sliderRect.position = Vector2(0, slidertHeight);
    _sliderRect.size = Vector2(
      sliderWidth,
      slidertHeight);

    _knobRect.position.y = slidertHeight*3 / 2;
    if(volume * sliderWidth < _knobRect.size.x/2){
      _knobRect.position.x = _knobRect.size.x/2;
    }else if(volume * sliderWidth > sliderWidth - _knobRect.size.x/2){
      _knobRect.position.x = sliderWidth - _knobRect.size.x/2;
    }else{
      _knobRect.position.x = volume * sliderWidth;
    }
    _knobRect.size = Vector2(sliderWidth/10, slidertHeight*3);

    // _icon.size = Vector2(slidertHeight*3, slidertHeight*3);
    // _icon.position = Vector2(-slidertHeight*3, 0);

    volumeIconComponent.size = Vector2(sliderWidth*3, sliderWidth*3);
    volumeIconComponent.position = Vector2(0, -sliderWidth);

    super.onGameResize(newSize);
  }

}