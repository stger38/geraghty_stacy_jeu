library libcrac;
import 'dart:html';
import 'dart:math';
import 'dart:isolate';

part 'Game.dart';
part 'Image.dart';

void main() {
  CanvasElement canvas = document.query('#canvas');
  Game Gam = new Game(canvas);

}
