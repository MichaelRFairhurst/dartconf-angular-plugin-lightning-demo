import 'dart:html';

import 'package:angular/angular.dart';

import 'brain_room.dart';

@Directive(selector: 'game-box')
class BoxComponent {
  final Element _el;

  BoxComponent(this._el) {
    _el.style.position = 'absolute';
    _el.style.height = '70px';
    _el.style.width = '70px';
    _el.style.padding = '15px';
    _el.style.textAlign = 'center';
    _el.style.color = 'black';
  }

  @Input()
  set color(String color) => _el.style.backgroundColor = color;
  @Input()
  set large(bool large) {
    if (large) {
      _el.style.height = '300px';
    }
  }

  @Input()
  set x(double x) => _el.style.left = '${x.toInt()}px';

  @Input()
  set y(double y) => _el.style.top = '${y.toInt()}px';
}
