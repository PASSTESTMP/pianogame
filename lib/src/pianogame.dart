import 'dart:async';
import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:pianogame/src/components/UI/gameconf.dart';
import 'package:pianogame/src/components/UI/gamescore.dart';
import 'package:pianogame/src/components/logic/gamelogic.dart';
import 'package:pianogame/src/config.dart';

import 'components/components.dart';

class PianoGame extends FlameGame with KeyboardEvents {
  int gameTempo = defaultTempo;
  int numberOfNotes = defaultNotes;
  int gameScore = 0;
  double gameVolume = defaultVomule;
  late Gameconf gameconf;
  late Volume volumeSlider;
  PianoGame()
  :super(
    // camera: CameraComponent.withFixedResolution(
    // width: gameWidth,
    // height: gameHeight,
    // )
  ){
    volumeSlider = Volume(changeVolume: changeVolume);
  }

  Gamelogic logic = Gamelogic();

  List<String> activeKeys = [];
  
  bool gameStarted = false;
  
  late Gameboard gameboard;
  
  late Iterable<PianoKey> keys;

  Future<void> activateKey(String key) async {
    if(gameStarted){
      var score =  logic.compareNotes(key, activeKeys);
      gameboard.showUsedNote(key, score[1]);
      if (score[0] != -1){
        gameScore = (score[0]/ activeKeys.length *100).toInt();
        await Future.delayed(Duration(seconds: 1));
        showScore();
      }
    }else{
      if(activeKeys.contains(key)){
      activeKeys.remove(key);
      return;
      }
      activeKeys.add(key);
    } 
  }

  void sort(){
    Map <double, String> sorter = {};
    for(int i=0; i<keys.length; i++){
      if(activeKeys.contains(keys.elementAt(i).note)){
        if(keys.elementAt(i).white){
          sorter[keys.elementAt(i).keyNr + 0.5] = keys.elementAt(i).note;
        }else{
          sorter[keys.elementAt(i).keyNr.toDouble()] = keys.elementAt(i).note;
        }
      }
    }
    var sortedMap = Map.fromEntries(
      sorter.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
    activeKeys = sortedMap.values.toList();
  }

  void randomize(){
    Random random = Random();
    List<String> randomList = [];

    for(int i=0; i<numberOfNotes; i++){
      int randomIndex = random.nextInt(activeKeys.length);
      randomList.add(activeKeys.elementAt(randomIndex));
    }

    activeKeys = randomList;

  }

  void changeVolume(double newVolume){
    gameVolume = newVolume;
  }

  double getVolume(){
    return gameVolume;
  }

  void changeTempo(String newTempo){
    gameTempo = int.parse(newTempo);
  }

  void changeNumberOfNotes(String newNoumberOfNotes){
    numberOfNotes = int.parse(newNoumberOfNotes);
  }

  Future<void> deactiveKeys() async {
    for(int i=0; i<keys.length; i++){
      keys.elementAt(i).deactive();
      keys.elementAt(i).isStarted = true;
    }
    await Future.delayed(Duration(seconds: 1));
    sort();
    List<String> actualNoteList = keys.map((singleNote) => singleNote.note).toList();
    for(int i=0; i<activeKeys.length; i++){
      var x = actualNoteList.indexOf(activeKeys.elementAt(i));
      playSound(keys.elementAt(x).lightKey());
      double msec = 60000/gameTempo;
      await Future.delayed(Duration(milliseconds: msec.toInt()));
      keys.elementAt(x).deactive();
    }
    await Future.delayed(Duration(seconds: 1));
    randomize();
    for(int i=0; i<activeKeys.length; i++){
      var x = actualNoteList.indexOf(activeKeys.elementAt(i));
      playSound(keys.elementAt(x).lightKey());
      keys.elementAt(x).deactive();
      double msec = 60000/gameTempo;
      await Future.delayed(Duration(milliseconds: msec.toInt()));
    }
    for(int i=0; i<keys.length; i++){
      if(activeKeys.contains(keys.elementAt(i).note)) {
        keys.elementAt(i).activate();
      }
    }
  }


  void startGame() {
    if(activeKeys.length<3) return;
    deactiveKeys();
    gameStarted = true;
    world.remove(world.children.query<Gameconf>().first);
    logic.start();
    gameboard = Gameboard(numberOfNotes: numberOfNotes);
    world.add(gameboard);
    bringVolumeToFront();
  }

  @override
  FutureOr<void> onLoad() async {

    Keyboard keyboard = Keyboard(activateKey: activateKey, getVolume: getVolume);
    gameconf = Gameconf(
      startGame: startGame,
      changeTempo: changeTempo,
      changeNumberOfNotes: changeNumberOfNotes,
      );
    

    world.add(keyboard);
    keys = world.children.query<Keyboard>().first.children.query<PianoKey>();


    // +++++++++++++ DEBUG ++++++++++
    // TODO: DEBUGMODE
    world.debugMode = false;

    world.add(gameconf);

    world.add(volumeSlider);
    

    return super.onLoad();
  }

  void playSound(String source) async {
    if(source != ""){
      await FlameAudio.audioCache.load(source);
      FlameAudio.play(source, volume: gameVolume);
    }
  }

  void bringVolumeToFront() {
    world.remove(volumeSlider); // Usuń komponent z hierarchii
    world.add(volumeSlider);    // Ponownie go dodaj (teraz będzie na wierzchu)
  }

  @override
  KeyEventResult onKeyEvent (
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
        super.onKeyEvent(event, keysPressed);
        if(gameStarted) return KeyEventResult.handled;
        if(event is KeyRepeatEvent){
          return KeyEventResult.handled;
        }
        var sound = "";
        switch (event.logicalKey) {
          case LogicalKeyboardKey.keyQ:
            var x = noteList.indexOf("C1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyW:
            var x = noteList.indexOf("D1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyE:
            var x = noteList.indexOf("E1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyR:
            var x = noteList.indexOf("F1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyT:
            var x = noteList.indexOf("G1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyY:
            var x = noteList.indexOf("A1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyU:
            var x = noteList.indexOf("B1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyI:
            var x = noteList.indexOf("C2");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyO:
            var x = noteList.indexOf("D2");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.keyP:
            var x = noteList.indexOf("E2");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit2:
            var x = noteList.indexOf("C#1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit3:
            var x = noteList.indexOf("D#1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit5:
            var x = noteList.indexOf("F#1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit6:
            var x = noteList.indexOf("G#1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit7:
            var x = noteList.indexOf("A#1");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit9:
            var x = noteList.indexOf("C#2");
            sound = keys.elementAt(x).lightKey();
            break;
          case LogicalKeyboardKey.digit0:
            var x = noteList.indexOf("D#2");
            sound = keys.elementAt(x).lightKey();
            break;
        }
        if(sound!="") playSound(sound);
      
    return KeyEventResult.handled;
  }
  
  void showScore() {
    activateKeys();
    gameStarted = false;
    world.remove(world.children.query<Gameboard>().first);
    Gamescore gamescore = Gamescore(score: gameScore, restart: restartGame);
    world.add(gamescore);
  }
  
  void activateKeys() {
    for(int i=0; i<keys.length; i++){
      keys.elementAt(i).activate();
      keys.elementAt(i).decolor();
      keys.elementAt(i).isStarted = false;
    }
  }

  void restartGame() {
    gameStarted = false;
    activeKeys = [];
    world.remove(world.children.query<Gamescore>().first);
    world.add(gameconf);
    bringVolumeToFront();
    activateKeys();
  }
}