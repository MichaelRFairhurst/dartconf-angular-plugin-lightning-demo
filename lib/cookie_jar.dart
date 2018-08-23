import 'cookie.dart';
import 'coord.dart';
import 'moving.dart';

class CookieJar extends Moving {
  Coord pos;
  final Coord velocity;

  final cookies = List<Cookie>.generate(5, (_) => Cookie());

  CookieJar(this.pos, this.velocity);

  factory CookieJar.atEdge(Coord window) =>
      Moving.atEdge(window, (pos, velocity) => CookieJar(pos, velocity));
}
