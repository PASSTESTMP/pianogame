import 'package:flame/components.dart';
import 'package:flame/game.dart';

class DynamicParameters {
  double gameWidth = 1920;
  double gameHeight = 1080;
  double startButtonWidth = 1920/6;
  double startButtonHeight = 1920/6;
  double startButtonX = 1920 / 2;
  double startButtonY = 1920 / 4;
  double gameboardWidth = 1920 * 0.9;
  double gameboardHeight = 1080 * 0.9;
  double gameboardX = 1920 / 2;
  double gameboardY = 1080 / 4;

  void updateParameters(Vector2 monitorSize){
    gameWidth = monitorSize.x;
    gameHeight = monitorSize.y;
    startButtonWidth = monitorSize.x < monitorSize.y ? monitorSize.x/3 : monitorSize.y/3;
    startButtonHeight = startButtonWidth;
    startButtonX = monitorSize.x / 2;
    startButtonY = monitorSize.y / 4;
    gameboardWidth = gameWidth * 0.9;
    gameboardHeight = gameHeight * 0.9;
    gameboardX = gameWidth / 2;
    gameboardY = gameHeight / 4;
  }

  
}