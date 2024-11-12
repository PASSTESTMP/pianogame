import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Dropelement extends RectangleComponent with DragCallbacks{
  String caption;


  Dropelement({size, paint, required this.caption}):super(
    size: size,
    paint: paint,
  );

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.y += event.localDelta.y;
    super.onDragUpdate(event);
  }

  @override
  FutureOr<void> onLoad() {
    TextComponent captionIndicator = TextComponent(text: caption);
    add(captionIndicator);
    return super.onLoad();
  }


}