import 'package:pianogame/src/components/UI/gameboard.dart';
import 'package:pianogame/src/components/UI/gameconf.dart';
import 'package:pianogame/src/components/UI/gamescore.dart';
import 'package:pianogame/src/components/UI/keyboard.dart';
import 'package:pianogame/src/components/parameters/dynamic_parameters.dart';
import 'package:pianogame/src/config.dart';

class DynamicLayout {
  DynamicParameters dynamicParameters = DynamicParameters();
  late Gameboard gameboard;
  late Keyboard keyboard;
  late Gameconf gameconf;
  late Gamescore gamescore;
  bool notInitialized = true;
  int numberOfNotes = defaultNotes;
  Function activateKey;
  Function getVolume;

  DynamicLayout({required this.activateKey, required this.getVolume});

  void initialization() {
    gameboard = Gameboard(numberOfNotes: numberOfNotes, dynamicParameters: dynamicParameters);
    keyboard = Keyboard(activateKey: activateKey, getVolume: getVolume);
    // gameconf = Gameconf(startGame: startGame, changeTempo: changeTempo, changeNumberOfNotes: changeNumberOfNotes, changeVolume: changeVolume, dynamicParameters: dynamicParameters);
    // gamescore = Gamescore(score: score, restart: restart);
    notInitialized = false;
  }

  void update(){
    if(notInitialized){
      initialization();
    }
    gameboard.updateFromParameters();
    keyboard.updateFromParameters();
  }
  
}