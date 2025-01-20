/*
jeden klocek
po kliknieciu pojawiaja sie jeszcze 2, jeden u góry jeden niżej
drag i move przesowa gora dol, pozycje tak by jeden byl na srodku z minimalna animacja

*/

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/UIdefaults/killface.dart';
import 'package:pianogame/src/config.dart';


class DropElement extends PositionComponent with TapCallbacks {
  String actVal;
  Function setActualValue;
  List<int> positionPoint; // [which, how many]
  DropElement({
    required this.actVal,
    required this.positionPoint,
    required Vector2 size,
    required this.setActualValue,
  }) : super(position: Vector2.zero(), size: size);

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()..color = dropColor;
    canvas.drawRect(size.toRect(), paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: actVal,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(size.x / 2 - textPainter.width / 2, size.y / 2 - textPainter.height / 2),
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    setActualValue(actVal);
    super.onTapDown(event);
  }

  @override
  void onGameResize(Vector2 newSize) {
    double boardWidth = newSize.x * magicPadding;
    double boardHeight = newSize.y * magicPadding/ magicDivision;
    double elementWidth;
    double elementHeight;

    if(boardWidth /3 > boardHeight / 2){
      elementWidth = boardHeight / 2;
      elementHeight = elementWidth;
    }else{
      elementWidth = boardWidth /3;
      elementHeight = elementWidth;
    }

    position = Vector2(
      boardWidth / positionPoint[1] * (positionPoint[0]) + boardWidth / positionPoint[1]/2 - elementWidth / 2,
      boardHeight / 4 * magicDivision
    );
    size = Vector2(elementWidth, elementHeight);
    super.onGameResize(newSize);
  }
}


class DropDown extends RectangleComponent with TapCallbacks {
  bool expanded = false;
  late List<Component> additionalFields;
  String actVal = "";
  String parameterName = "";
  List values = List.empty();
  Function changeFunction;
  TextComponent caption = TextComponent();

  DropDown({
    required this.parameterName,
    required this.actVal,
    required this.values,
    required Vector2 position,
    required Vector2 size,
    required this.changeFunction,
  }) : super(
    position: position,
    size: size,
    paint: Paint()..color = transparent
    );

  @override
  FutureOr<void> onLoad() {
    caption = TextComponent(
      text: "$parameterName $actVal",
      anchor: Anchor.centerLeft,
      position: Vector2(size.x / 2, size.y / 2)
      );
    add(caption);
    return super.onLoad();
  }

  void setActVal(String val){
    expanded = false;
    actVal = val;
    additionalFields.forEach(parent!.remove);
    changeFunction(val);
    caption.text = "$parameterName $actVal";
  }

  void killDropDown() {
    expanded = false;
    if (additionalFields.isNotEmpty){
      additionalFields.forEach(parent!.remove);
    }

  }

  @override
  void onTapDown(TapDownEvent event) {
    if (!expanded) {
      expanded = true;

      additionalFields = [Killface(killFunction: killDropDown)];

      for(var i = 0; i < values.length; i++){
        
        additionalFields.add(
          DropElement(
            actVal: values.elementAt(i).toString(),
            positionPoint: [i, values.length],
            size: size,
            setActualValue: setActVal,
          ),
        );
      }

      parent?.addAll(additionalFields);
    } else {
      expanded = false;
      additionalFields.forEach(parent!.remove);
    }
    super.onTapDown(event);
  }

  @override
  void onGameResize(Vector2 newSize) {
    double newFontSize = size.y/4;

    caption.textRenderer = TextPaint(
        style: TextStyle(
          fontSize: newFontSize,
        )
      );
      caption.position = Vector2(0, size.y / 2);

    super.onGameResize(newSize);
  }
}