import 'dart:math';

import 'coord.dart';

abstract class Moving {
  Coord pos;
  Coord get velocity;

  bool isFarOutside(Coord window) {
    final xmargin = window.x * 0.21;
    final ymargin = window.y * 0.21;
    return pos.x < -xmargin ||
        pos.x > window.x + xmargin ||
        pos.y < -ymargin ||
        pos.y > window.y + ymargin;
  }

  void move() {
    pos = pos.move(velocity.x, velocity.y);
  }

  static T atEdge<T>(
      Coord window, T Function(Coord pos, Coord velocity) constructor) {
    final random = Random();
    final margin = 0.1;
    final axis = random.nextBool();
    final extreme = random.nextBool();
    final speed = random.nextDouble() * 3 + 1.5;
    final mainOffset = (random.nextDouble() - margin) * (1 + margin * 2);
    final mainVelocity = random.nextDouble() * speed;
    final otherOffset = extreme ? -margin : 1 + margin;
    final otherVelocity = extreme ? speed : -speed;

    final xOffset = axis ? mainOffset : otherOffset;
    final xVelocity = axis ? mainVelocity : otherVelocity;
    final yOffset = axis ? otherOffset : mainOffset;
    final yVelocity = axis ? otherVelocity : mainVelocity;

    return constructor(Coord(xOffset * window.x, yOffset * window.y),
        Coord(xVelocity, yVelocity));
  }
}
