import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:pianogame/src/config.dart';

class PianoKey extends RectangleComponent with TapCallbacks {
  int keyNr = 0;
  bool white = true;
  String note = "C2";
  Function activation;
  bool active = true;
  bool isStarted = false;
  double actVolume = 0.1;
  Function getVolume;
  double whiteKeyWidth = defaultWhiteKeyWidth;
  double  whiteKeyHeight = defaultWhiteKeyHeight;
  double  blackKeyWidth = defaultBlackKeyWidth;
  double  blackKeyHeight = defaultBlackKeyHeight;
  // TODO: add dependency from configuration parameters
  int numberOfWhiteKeys;

  PianoKey({
    required this.note,
    required this.activation,
    required this.getVolume,
    required this.numberOfWhiteKeys,
    }):super();
  late String sound = "";

  void deactive(){
    active = false;
    paint.color = notActive;
  }

  void activate(){
    active = true;
    paint.color = white ? whiteKey : blackKey;
  }

  String playSound(){
    return sound;
  }

  void updateVolume(){
    actVolume = getVolume();
  }

  String lightKey(){
    if(white){
      paint.color = paint.color == selectedKey ? whiteKey : selectedKey;
      if(paint.color == selectedKey){
      return playSound();
    }
    }else{
      paint.color = paint.color == selectedBlackKey ? blackKey : selectedBlackKey;
      if(paint.color == selectedBlackKey){
      return playSound();
    }
    }
    return "";
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    if(!active) return;
    await FlameAudio.audioCache.load(sound);
    updateVolume();
    FlameAudio.play(sound, volume: actVolume);
    if(isStarted){
      paint.color = white ? selectedKey : selectedBlackKey;
    }else {
      lightKey();
    }
    activation(note);
    super.onTapDown(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    if(isStarted && active){
      paint.color = white ? whiteKey : blackKey;
    }
    super.onTapCancel(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    if(isStarted && active){
      paint.color = white ? whiteKey : blackKey;
    }
    super.onTapUp(event);
  }

  void decolor(){
    paint.color = white ? whiteKey : blackKey;
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
        sound = 'key02.mp3';
        break;
      case "D1":
        keyNr = 1;
        white = true;
        sound = 'key03.mp3';
        break;
      case "D#1":
        keyNr = 2;
        white = false;
        sound = 'key04.mp3';
        break;
      case "E1":
        keyNr = 2;
        white = true;
        sound = 'key05.mp3';
        break;
      case "F1":
        keyNr = 3;
        white = true;
        sound = 'key06.mp3';
        break;
      case "F#1":
        keyNr = 4;
        white = false;
        sound = 'key07.mp3';
        break;
      case "G1":
        keyNr = 4;
        white = true;
        sound = 'key08.mp3';
        break;
      case "G#1":
        keyNr = 5;
        white = false;
        sound = 'key09.mp3';
        break;
      case "A1":
        keyNr = 5;
        white = true;
        sound = 'key10.mp3';
        break;
      case "A#1":
        keyNr = 6;
        white = false;
        sound = 'key11.mp3';
        break;
      case "B1":
        keyNr = 6;
        white = true;
        sound = 'key12.mp3';
        break;
      case "C2":
        keyNr = 7;
        white = true;
        sound = 'key13.mp3';
        break;
      case "C#2":
        keyNr = 8;
        white = false;
        sound = 'key14.mp3';
        break;
      case "D2":
        keyNr = 8;
        white = true;
        sound = 'key15.mp3';
        break;
      case "D#2":
        keyNr = 9;
        white = false;
        sound = 'key16.mp3';
        break;
      case "E2":
        keyNr = 9;
        white = true;
        sound = 'key17.mp3';
        break;
      case "F2":
        keyNr = 10;
        white = true;
        sound = 'key18.mp3';
        break;
      case "F#2":
        keyNr = 11;
        white = false;
        sound = 'key19.mp3';
        break;
      case "G2":
        keyNr = 11;
        white = true;
        sound = 'key20.mp3';
        break;
      case "G#2":
        keyNr = 12;
        white = false;
        sound = 'key21.mp3';
        break;
      case "A2":
        keyNr = 12;
        white = true;
        sound = 'key22.mp3';
        break;
      case "A#2":
        keyNr = 13;
        white = false;
        sound = 'key23.mp3';
        break;
      case "B2":
        keyNr = 13;
        white = true;
        sound = 'key24.mp3';
        break;
      default:
        keyNr = 0;
        white = true;
        sound = 'key24.mp3';
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

  @override
  void onGameResize(Vector2 newSize) {
    whiteKeyWidth = (newSize.x - numberOfWhiteKeys)* 0.9 / numberOfWhiteKeys;
    whiteKeyHeight = newSize.y / 2 * 0.9;
    blackKeyWidth = whiteKeyWidth * 0.8;
    blackKeyHeight = whiteKeyHeight * 0.6;

    position = Vector2(
      white ? (whiteKeyWidth+1)*keyNr : (whiteKeyWidth+1)*keyNr - blackKeyWidth/2,
      0);
    size = white ? Vector2(whiteKeyWidth, whiteKeyHeight) : Vector2(blackKeyWidth, blackKeyHeight);

    super.onGameResize(newSize);
  }
}