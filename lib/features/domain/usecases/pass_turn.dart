import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';

abstract class PassTurn {
  Game call(Game game);
}

class PassTurnImp extends PassTurn {
  @override
  Game call(Game game) {
    if (game.currentPlayer == Cor.brancas) {
      return Game(
          white: game.white,
          black: game.black,
          currentPlayer: Cor.pretas,
          moves: game.moves + 1);
    }
    return Game(
        white: game.white,
        black: game.black,
        currentPlayer: Cor.brancas,
        moves: game.moves + 1);
  }
}
