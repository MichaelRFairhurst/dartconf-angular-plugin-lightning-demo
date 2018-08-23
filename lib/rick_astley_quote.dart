import 'dart:math';

import 'coord.dart';
import 'moving.dart';

class RickAstleyQuote extends Moving {
  Coord pos;
  Coord velocity;
  String quote;

  RickAstleyQuote(this.pos, this.velocity, int index) {
    switch (index) {
      case 0:
        quote = "We're no strangers to love";
        break;
      case 1:
        quote = "You know the rules and so do I";
        break;
      case 2:
        quote = "A full commitment's what I'm thinking of";
        break;
      case 3:
        quote = "You wouldn't get this from any other guy";
        break;
      case 4:
        quote = "I just wanna tell you how I'm feeling";
        break;
      case 5:
        quote = "Gotta make you understand";
        break;
      case 6:
        quote = "Never gonna give you up";
        break;
      case 7:
        quote = "Never gonna let you down";
        break;
      case 8:
        quote = "Never gonna run around and desert you";
        break;
      case 9:
        quote = "Never gonna make you cry";
        break;
      case 10:
        quote = "Never gonna say goodbye";
        break;
      case 11:
        quote = "Never gonna tell a lie and hurt you";
        break;
      case 12:
        quote = "We've known each other for so long";
        break;
      case 13:
        quote = "Your heart's been aching but you're too shy to say it";
        break;
      case 14:
        quote = "Inside we both know what's been going on";
        break;
      case 15:
        quote = "We know the game and we're gonna play it";
        break;
      case 16:
        quote = "And if you ask me how I'm feeling";
        break;
      case 17:
        quote = "Don't tell me you're too blind to see";
        break;
      case 18:
        quote = "Never gonna give you up";
        break;
      case 19:
        quote = "Never gonna let you down";
        break;
      case 20:
        quote = "Never gonna run around and desert you";
        break;
      case 21:
        quote = "Never gonna make you cry";
        break;
      case 22:
        quote = "Never gonna say goodbye";
        break;
      case 23:
        quote = "Never gonna tell a lie and hurt you";
        break;
      case 24:
        quote = "Never gonna give you up";
        break;
      case 25:
        quote = "Never gonna let you down";
        break;
      case 26:
        quote = "Never gonna run around and desert you";
        break;
      case 27:
        quote = "Never gonna make you cry";
        break;
      case 28:
        quote = "Never gonna say goodbye";
        break;
      case 29:
        quote = "Never gonna tell a lie and hurt you";
        break;
      case 30:
        quote = "Never gonna give, never gonna give";
        break;
      case 31:
        quote = "(Give you up)";
        break;
      case 32:
        quote = "(Ooh) Never gonna give, never gonna give";
        break;
      case 33:
        quote = "(Give you up)";
        break;
      case 34:
        quote = "We've known each other for so long";
        break;
      case 35:
        quote = "Your heart's been aching but you're too shy to say it";
        break;
      case 36:
        quote = "Inside we both know what's been going on";
        break;
      case 37:
        quote = "We know the game and we're gonna play it";
        break;
      case 38:
        quote = "I just wanna tell you how I'm feeling";
        break;
      case 39:
        quote = "Gotta make you understand";
        break;
      case 40:
        quote = "Never gonna give you up";
        break;
      case 41:
        quote = "Never gonna let you down";
        break;
      case 42:
        quote = "Never gonna run around and desert you";
        break;
      case 43:
        quote = "Never gonna make you cry";
        break;
      case 44:
        quote = "Never gonna say goodbye";
        break;
      case 45:
        quote = "Never gonna tell a lie and hurt you";
        break;
      case 46:
        quote = "Never gonna give you up";
        break;
      case 47:
        quote = "Never gonna let you down";
        break;
      case 48:
        quote = "Never gonna run around and desert you";
        break;
      case 49:
        quote = "Never gonna make you cry";
        break;
      case 50:
        quote = "Never gonna say goodbye";
        break;
      case 51:
        quote = "Never gonna tell a lie and hurt you";
        break;
      case 52:
        quote = "Never gonna give you up";
        break;
      case 53:
        quote = "Never gonna let you down";
        break;
      case 54:
        quote = "Never gonna run around and desert you";
        break;
      case 55:
        quote = "Never gonna make you cry";
        break;
    }
  }

  factory RickAstleyQuote.atEdge(Coord window) => Moving.atEdge(window,
      (pos, velocity) => RickAstleyQuote(pos, velocity, Random().nextInt(55)));
}
