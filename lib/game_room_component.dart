import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';

import '100_sunburns.dart';
import 'box_component.dart';
import 'cookie.dart';
import 'cookie_component.dart';
import 'cookie_jar.dart';
import 'coord.dart';
import 'moving.dart';
import 'rick_astley_quote.dart';

@Component(
    selector: 'game-room',
    templateUrl: 'game_room_component.html',
    directives: [NgStyle, NgFor, NgIf, BoxComponent, CookieComponent])
class GameRoomComponent {
  Coord brainPos;
  CookieJar cookieJar;
  Coord windowSize;
  Coord cursorPos;

  int score = 0;
  int step = 0;
  int health = 5;
  StreamController<int> _deadController = new StreamController<int>();
  final sunburnses = <$100Sunburns>[];
  final rickAstleyQuotes = <RickAstleyQuote>[];

  GameRoomComponent() {
    _init();
  }

  @Output()
  Stream<int> get dead => _deadController.stream;

  void eatDatCookie(Cookie cookie) {
    cookie.eaten = true;
    score++;
  }

  void _create100Sunburns() {
    sunburnses.add($100Sunburns.atEdge(windowSize));
  }

  void _createRickAstleyQuote() {
    rickAstleyQuotes.add(RickAstleyQuote.atEdge(windowSize));
  }

  void _gameStep() {
    step++;
    if (cursorPos != null) {
      brainPos = brainPos.stepTo(cursorPos, 0.01);
    }

    // copy before modify
    new List<$100Sunburns>.from(sunburnses).forEach((sunburns) {
      if (sunburns.isFarOutside(windowSize)) {
        sunburnses.remove(sunburns);
        sunburnses.add($100Sunburns.atEdge(windowSize));
      } else if (sunburns.pos.hasHit(brainPos)) {
        sunburnses.remove(sunburns);
        sunburnses.add($100Sunburns.atEdge(windowSize));
        health -= 1;
      } else {
        sunburns.move();
      }
    });

    // copy before modify
    new List<RickAstleyQuote>.from(rickAstleyQuotes).forEach((rickAstleyQuote) {
      if (rickAstleyQuote.isFarOutside(windowSize)) {
        rickAstleyQuotes.remove(rickAstleyQuote);
        rickAstleyQuotes.add(RickAstleyQuote.atEdge(windowSize));
      } else if (rickAstleyQuote.pos.hasHit(brainPos)) {
        rickAstleyQuotes.remove(rickAstleyQuote);
        rickAstleyQuotes.add(RickAstleyQuote.atEdge(windowSize));
        health = health < 5 ? health + 1 : 5;
      } else {
        rickAstleyQuote.move();
      }
    });

    cookieJar.move();
    if (cookieJar.isFarOutside(windowSize)) {
      print('here $cookieJar');
      _resetCookieJar();
    }

    int headStart = 200;
    int curveReduction = 1000; // some n
    // 1 / (x + n) where n reduces the speed of the curve
    double maximum = 1 / curveReduction; // y where x = 0 for some n
    // now 1 / (x + n) starts at some h. Factor so that it starts at 1
    double factor = 1 / maximum;
    // now invert it so it goes from 0 to 1 instead of 1 to 0.
    double difficulty = 1 - factor / (step + curveReduction + headStart);
    if (sunburnses.length < (difficulty * 150).toInt()) {
      sunburnses.add($100Sunburns.atEdge(windowSize));
    }
  }

  void _init() async {
    _watchCursor();
    _watchResize();

    brainPos = Coord((windowSize.x / 2), (windowSize.y / 2));

    for (var i = 1; i >= 0; --i) {
      _create100Sunburns();
    }
    for (var i = 3; i >= 0; --i) {
      _createRickAstleyQuote();
    }

    _resetCookieJar();

    while (health > 0) {
      await Future.delayed(Duration(milliseconds: 30));
      _gameStep();
    }

    _deadController.add(score);
  }

  void _resetCookieJar() {
    cookieJar = CookieJar.atEdge(windowSize);
  }

  void _watchCursor() {
    window.onMouseMove.listen((move) {
      cursorPos = Coord(move.client.x, move.client.y);
    });
  }

  void _watchResize() {
    void onResize() {
      windowSize =
          Coord(window.innerWidth.toDouble(), window.innerHeight.toDouble());
    }

    onResize();
    window.onResize.listen((resize) {
      onResize();
    });
  }
}
