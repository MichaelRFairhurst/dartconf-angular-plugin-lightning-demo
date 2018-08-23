import 'coord.dart';
import 'moving.dart';

class $100Sunburns extends Moving {
  Coord pos;
  final Coord velocity;

  $100Sunburns(this.pos, this.velocity);

  factory $100Sunburns.atEdge(Coord window) =>
      Moving.atEdge(window, (pos, velocity) => $100Sunburns(pos, velocity));
}
