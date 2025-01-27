import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/config.dart';

class Volume extends RectangleComponent with DragCallbacks, TapCallbacks{
  double outVolume;
  Function changeVolume;
  double sliderWidth = defaultSliderWidth;
  double slidertHeight = defaultSliderWidth;
  SpriteComponent volumeIconComponent = SpriteComponent(anchor: Anchor.center);
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
    _updateVolume(volume);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _updateVolume(event.localPosition.y);
    changeVolume(1 - volume);
    super.onTapDown(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    _updateVolume(event.localEndPosition.y);
    changeVolume(1 - volume);
    super.onDragUpdate(event);
  }

  // Funkcja do aktualizacji głośności na podstawie położenia wskaźnika
  void _updateVolume(double y) {
    double relativeY = (y).clamp(0, _sliderRect.size.y);
    volume = relativeY / _sliderRect.size.y;
    _updateSlider();
  }

  // Aktualizuje pozycje prostokątów (paska i wskaźnika)
  void _updateSlider() {
    if(volume * _sliderRect.size.y < _knobRect.size.y/2){
      _knobRect.position.y = _knobRect.size.y/2;
    }else if(volume * _sliderRect.size.y > _sliderRect.size.y - _knobRect.size.y/2){
      _knobRect.position.y = _sliderRect.size.y - _knobRect.size.y/2;
    }else{
      _knobRect.position.y = volume * _sliderRect.size.y;
    }
    }

  @override
  void onGameResize(Vector2 newSize) {
    sliderWidth = newSize.x * magicPadding / 50;
    slidertHeight = newSize.y * magicPadding / magicDivision * 4/5;

    position = Vector2(
      newSize.x * magicPadding / 2 - sliderWidth*2,
      - newSize.y/3+slidertHeight/16);
    size = Vector2(
      slidertHeight/8,
      slidertHeight);

    volumeIconComponent.size = Vector2(slidertHeight/6, slidertHeight/6);
    volumeIconComponent.position = Vector2(
      volumeIconComponent.size.x/4,
      slidertHeight - volumeIconComponent.size.y/4);

    _sliderRect.size = Vector2(
      slidertHeight/10,
      slidertHeight - slidertHeight/8);

    _sliderRect.anchor = Anchor.center;

    _sliderRect.position = Vector2(slidertHeight/16, _sliderRect.size.y/2);

    _knobRect.position.x = slidertHeight/16;
    if(volume * _sliderRect.size.y < _knobRect.size.y/2){
      _knobRect.position.y = _knobRect.size.y/2;
    }else if(volume * _sliderRect.size.y > _sliderRect.size.y - _knobRect.size.y/2){
      _knobRect.position.y = _sliderRect.size.y - _knobRect.size.y/2;
    }else{
      _knobRect.position.y = volume * _sliderRect.size.y;
    }
    _knobRect.size = Vector2(slidertHeight/5, slidertHeight/10);

    // _icon.size = Vector2(slidertHeight*3, slidertHeight*3);
    // _icon.position = Vector2(-slidertHeight*3, 0);

    

    super.onGameResize(newSize);
  }

}