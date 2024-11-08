import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:pianogame/src/config.dart';

class PianoKey extends RectangleComponent {
  int keyNr = 0;
  bool white = true;
  String note = "C2";
  PianoKey({required this.note}):super();
  late String sound = "";


  String playSound(){
    return sound;
  }

  String lightKey(){
    if(white){
      paint.color = paint.color == selectedKey ? whiteKey : selectedKey;
    }else{
      paint.color = paint.color == selectedKey ? blackKey : selectedKey;
    }
    if(paint.color == selectedKey){
      return playSound();
    }
    return "";
  }

    @override
  FutureOr<void> onLoad() {
    switch (note){
      case "C1":
        keyNr = 0;
        white = true;
        sound = 'key01.mp3';
        break;
      case "C#1":
        keyNr = 1;
        white = false;
        break;
      case "D1":
        keyNr = 1;
        white = true;
        break;
      case "D#1":
        keyNr = 2;
        white = false;
        break;
      case "E1":
        keyNr = 2;
        white = true;
        break;
      case "F1":
        keyNr = 3;
        white = true;
        break;
      case "F#1":
        keyNr = 4;
        white = false;
        break;
      case "G1":
        keyNr = 4;
        white = true;
        break;
      case "G#1":
        keyNr = 5;
        white = false;
        break;
      case "A1":
        keyNr = 5;
        white = true;
        break;
      case "A#1":
        keyNr = 6;
        white = false;
        break;
      case "B1":
        keyNr = 6;
        white = true;
        break;
      case "C2":
        keyNr = 7;
        white = true;
        break;
      case "C#2":
        keyNr = 8;
        white = false;
        break;
      case "D2":
        keyNr = 8;
        white = true;
        break;
      case "D#2":
        keyNr = 9;
        white = false;
        break;
      case "E2":
        keyNr = 9;
        white = true;
        break;
      case "F2":
        keyNr = 10;
        white = true;
        break;
      case "F#2":
        keyNr = 11;
        white = false;
        break;
      case "G2":
        keyNr = 11;
        white = true;
        break;
      case "G#2":
        keyNr = 12;
        white = false;
        break;
      case "A2":
        keyNr = 12;
        white = true;
        break;
      case "A#2":
        keyNr = 13;
        white = false;
        break;
      case "B2":
        keyNr = 13;
        white = true;
        break;
      default:
        keyNr = 0;
        white = true;
    }
    if(!white){
      paint = Paint()..color = blackKey;
    }
    
    position = Vector2(
      white ? (whiteKeyWidth+1)*keyNr : (whiteKeyWidth+1)*keyNr - blackKeyWidth/2,
      0);
    size = white ? Vector2(whiteKeyWidth, whiteKeyHeight) : Vector2(blackKeyWidth, blackKeyHeight);
    return super.onLoad();
  }
}