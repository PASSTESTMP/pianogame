import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MaskedRectangleComponent extends RectangleComponent {

  MaskedRectangleComponent({required size}):super(
    size: size,
    paint: Paint()..color = Color.fromARGB(0, 0, 0, 0)
  );

  @override
  void render(Canvas canvas) {
    // canvas.save();

    // Ustawiamy maskę na obszarze prostokąta komponentu
    canvas.clipRect(toRect());

    // Renderujemy elementy podrzędne tylko wewnątrz maski
    super.render(canvas);

    // canvas.restore(); // Usuwamy ograniczenie maski
  }
}