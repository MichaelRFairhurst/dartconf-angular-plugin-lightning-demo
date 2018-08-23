import 'dart:async';

import 'package:angular/angular.dart';

import 'cookie.dart';

@Component(
    selector: 'game-cookie',
    templateUrl: 'cookie_component.html',
    directives: [NgIf])
class CookieComponent {
  @Input()
  Cookie cookie;

  final _eatenChangedController = new StreamController<void>();

  @Output()
  Stream<void> get eatenChange => _eatenChangedController.stream;

  void reportEaten() {
    _eatenChangedController.add(null);
  }
}
