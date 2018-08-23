import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';

import 'game_room_component.dart';

@Component(
    selector: 'game-game',
    templateUrl: 'game_component.html',
    directives: [GameRoomComponent, NgIf])
class GameComponent {
  bool started = false;
  int lastScore;
  int highScore;

  void begin() => started = true;

  void gameOver(int score) {
    highScore = max(highScore ?? 0, score);
    lastScore = score;
    started = false;
  }
}
