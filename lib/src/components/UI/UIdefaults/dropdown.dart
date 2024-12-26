/*
jeden klocek
po kliknieciu pojawiaja sie jeszcze 2, jeden u góry jeden niżej
drag i move przesowa gora dol, pozycje tak by jeden byl na srodku z minimalna animacja

*/

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';


class DropElement extends PositionComponent with TapCallbacks {
  String actVal;
  Function setActualValue;
  double positionPoint;
  DropElement({
    required this.actVal,
    required this.positionPoint,
    required Vector2 size,
    required this.setActualValue,
  }) : super(position: Vector2.zero(), size: size);

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()..color = Colors.blue;
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
    double elementWidth;
    double elementHeight;

    if(newSize.x * 0.9 /3 > newSize.y * 0.9 / 4){
      elementWidth = newSize.y * 0.9 / 4;
      elementHeight = elementWidth;
    }else{
      elementWidth = newSize.x * 0.9 /3;
      elementHeight = elementWidth;
    }

    position = Vector2(
      newSize.x * 0.9 * positionPoint - elementWidth,
      newSize.y * 0.9 / 4
    );
    size = Vector2(elementWidth, elementHeight);
    super.onGameResize(newSize);
  }
}


class DropDown extends PositionComponent with TapCallbacks {
  bool expanded = false;
  late List<DropElement> additionalFields;
  String actVal = "";
  String parameterName = "";
  List values = List.empty();
  Function changeFunction;

  DropDown({
    required this.parameterName,
    required this.actVal,
    required this.values,
    required Vector2 position,
    required Vector2 size,
    required this.changeFunction,
  }) : super(position: position, size: size);



  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()..color = const Color.fromARGB(255, 47, 54, 59);
    canvas.drawRect(size.toRect(), paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: "$parameterName: $actVal",
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

  void setActVal(String val){
    expanded = false;
    actVal = val;
    additionalFields.forEach(parent!.remove);
    changeFunction(val);
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (!expanded) {
      expanded = true;
      additionalFields = [];

      for(var i = 0; i < values.length; i++){
        
        additionalFields.add(
          DropElement(
            actVal: values.elementAt(i).toString(),
            positionPoint: (i+1)/(values.length),
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
}