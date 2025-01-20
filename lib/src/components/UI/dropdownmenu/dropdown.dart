import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:pianogame/src/components/UI/rectanglemask.dart';
import 'package:pianogame/src/config.dart';

class Dropdown extends RectangleComponent with TapCallbacks{
  int ddNumber = 3;
  List values;

  Dropdown({required this.values})
  :super(
    size: Vector2(tempoWidth, tempoHeight),
    paint: Paint()..color = Color.fromARGB(0, 0, 0, 0)//transparent,
  );

  final maskedComponent = MaskedRectangleComponent(
      size: Vector2(tempoWidth, tempoHeight)
    );
    
      bool expanded = false;


  @override
  FutureOr<void> onLoad() {

    
    

    // // Dodajemy maskę do gry
    add(maskedComponent);

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    if(expanded){
      position.y += size.y;

      maskedComponent.size.y = tempoHeight;
      expanded = false;
    }else{
      position.y -= size.y;
      maskedComponent.size.y = 3*tempoHeight;
      super.onTapDown(event);
    }
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    maskedComponent.size.y = tempoHeight;

    position.y += size.y;
    super.onTapCancel(event);
  }


  @override
  void onTapUp(TapUpEvent event) {
    maskedComponent.size.y = tempoHeight;

    position.y += size.y;
    super.onTapUp(event);
  }

}

// class ElementContainer extends PositionComponent {
//   ElementContainer():super();

//   @override
//   FutureOr<void> onLoad() {
//     for(int i=0; i<values.length; i++){
//       final Dropelement dropelement = Dropelement(
//       size: size,
//       caption: values.elementAt(i).toString(),
//       paint: Paint()..color = transparent);

//       dropelement.position = Vector2(dropelement.position.x, dropelement.size.y*(1+i));


//       // // // Dodajemy komponent podrzędny do maski
//       maskedComponent.add(dropelement);
//     }
//     return super.onLoad();
//   }
// }

