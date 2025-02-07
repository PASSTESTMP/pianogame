import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class FloatingButton extends TextComponent with TapCallbacks {
  Function onPressed;
  FloatingButton(this.onPressed):super();

  @override
  FutureOr<void> onLoad() {
    text = "Skip";
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    onPressed();
    super.onTapDown(event);
  }
}