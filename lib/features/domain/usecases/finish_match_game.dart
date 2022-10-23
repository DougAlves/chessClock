import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/match.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/usecases/finish_game.dart';

abstract class FinishGameMatch {
  Match call(Match match, Player winner, Game game);
}

class FinishGameMatchImp extends FinishGameMatch {
  final FinishGame finishGame;
  FinishGameMatchImp(this.finishGame);
  @override
  Match call(Match match, Player winner, Game game) {
    match.games.add(finishGame(game, winner));
    if (match.games.where((egame) => egame.winner!.cor == Cor.brancas).length >
        match.bestOf) {
      return Match(
          white: match.white,
          black: match.black,
          bestOf: match.bestOf,
          winner: Cor.brancas,
          games: match.games);
    } else if (match.games
            .where((egame) => egame.winner!.cor == Cor.pretas)
            .length >
        match.bestOf) {
      return Match(
          white: match.white,
          black: match.black,
          bestOf: match.bestOf,
          winner: Cor.pretas,
          games: match.games);
    } else {
      return Match(
          white: match.white,
          black: match.black,
          bestOf: match.bestOf,
          games: match.games);
    }
  }
}
