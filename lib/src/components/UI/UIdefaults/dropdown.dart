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
  DropElement({
    required this.actVal,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size);

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
    // TODO: implement onTapDown
    super.onTapDown(event);
  }
}


class DropDown extends PositionComponent with TapCallbacks {
  bool expanded = false;
  late List<DropElement> additionalFields;
  String actVal = "";
  List values = List.empty();

  DropDown({
    required this.actVal,
    required this.values,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size);



  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()..color = Colors.blue;
    canvas.drawRect(size.toRect(), paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: expanded ? values.elementAt(0).toString() : actVal,
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
    if (!expanded) {
      expanded = true;
      additionalFields = [];

      for(var i = 1; i < values.length; i++){
        
        additionalFields.add(
          DropElement(
            actVal: values.elementAt(i).toString(),
            position: position + Vector2(0, (i)* (size.y + 10)),
            size: size,
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