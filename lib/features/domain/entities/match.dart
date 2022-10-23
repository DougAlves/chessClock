import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';

class Match {
  final Player white;
  final Player black;
  Cor? winner;
  final int bestOf;
  List<Game> games = [];
  Match(
      {required this.white,
      required this.black,
      required this.bestOf,
      this.winner,
      this.games = const []});
}
