import 'package:chess_clock/features/domain/entities/player.dart';

class Game {
  final Player white;
  final Player black;
  Cor currentPlayer;
  Player? winner;
  int moves;
  Game(
      {required this.white,
      required this.black,
      this.moves = 0,
      this.currentPlayer = Cor.brancas,
      this.winner});
}
