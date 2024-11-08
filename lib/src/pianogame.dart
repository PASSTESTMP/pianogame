import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:pianogame/src/config.dart';

import 'components/components.dart';

class PianoGame extends FlameGame with KeyboardEvents {
  PianoGame()
  :super(camera: CameraComponent.withFixedResolution(
    width: gameWidth,
    height: gameHeight,
    )
  );

  Keyboard keyboard = Keyboard();
  Volume volumeSlider = Volume();
  Tempo tempoSelector = Tempo();
  Notes notesSelector = Notes();

  @override
  FutureOr<void> onLoad() async {
    world.add(keyboard);
    // world.add(volumeSlider);
    // world.add(tempoSelector);
    // world.add(notesSelector);

    // for (int i=1; i<=9; i++){
    //   await FlameAudio.audioCache.load('assets/sounds/key0{i}.mp3');
    // }
    

    return super.onLoad();
  }

  void playSound(String source) async {
    if(source != ""){
      await FlameAudio.audioCache.load(source);
      FlameAudio.play(source);
    }
  }

  @override
  KeyEventResult onKeyEvent (
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
        super.onKeyEvent(event, keysPressed);
        if(event is KeyRepeatEvent){
          return KeyEventResult.handled;
        }
        var sound = "key24.mp3";
        final keys = world.children.query<Keyboard>().first.children.query<PianoKey>();
        switch (event.logicalKey) {
          case LogicalKeyboardKey.keyQ:
            var x = noteList.indexOf("C1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyW:
            var x = noteList.indexOf("D1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyE:
            var x = noteList.indexOf("E1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyR:
            var x = noteList.indexOf("F1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyT:
            var x = noteList.indexOf("G1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyY:
            var x = noteList.indexOf("A1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyU:
            var x = noteList.indexOf("B1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyI:
            var x = noteList.indexOf("C2");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyO:
            var x = noteList.indexOf("D2");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyP:
            var x = noteList.indexOf("E2");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit2:
            var x = noteList.indexOf("C#1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit3:
            var x = noteList.indexOf("D#1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit5:
            var x = noteList.indexOf("F#1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit6:
            var x = noteList.indexOf("G#1");
            keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit7:
            var x = noteList.indexOf("A#1");
            keys.elementAt(x).lightKey();
            break;
        }
        playSound(sound);
      
    return KeyEventResult.handled;
  }
}