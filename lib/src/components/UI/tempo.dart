import 'dart:async';

import 'package:flame/components.dart';
import 'package:pianogame/src/components/UI/dropdownmenu/dropdown.dart';
import 'package:pianogame/src/config.dart';

class Tempo extends PositionComponent {
  Tempo()
  :super(
    size: Vector2(tempoWidth, tempoHeight),
    position: Vector2(0, (keyboardHeight - 3*(gameWidth/2-keyboardWidth/2))/2 - tempoHeight/2)
  );

  void onSelected(int tempo){

  }


  @override
  FutureOr<void> onLoad() {

    Dropdown dp = Dropdown(values: tempoValues);

    add(dp);

    return super.onLoad();
  }

}