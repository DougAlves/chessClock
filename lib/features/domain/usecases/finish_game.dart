import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';

abstract class FinishGame {
  Game call(Game game, Player winner);
}

class FinishGameImp extends FinishGame {
  @override
  Game call(Game game, Player winner) {
    return Game(
        white: game.white,
        black: game.black,
        currentPlayer: Cor.pretas,
        moves: game.moves + 1,
        winner: winner);
  }
}
