class Coord {
  final double x;
  final double y;

  Coord(this.x, this.y);

  bool hasHit(Coord other) =>
      x < other.x + 100 &&
      y < other.y + 100 &&
      x + 100 > other.x &&
      y + 100 > other.y;

  Coord move(double addX, double addY) => Coord(x + addX, y + addY);

  Coord stepTo(Coord other, double amount) {
    final deltaX = other.x - x;
    final deltaY = other.y - y;

    return Coord(x + deltaX * amount, y + deltaY * amount);
  }
}
