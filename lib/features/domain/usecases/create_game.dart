import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/repository/game_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateGame {
  Either<Failure, Game> call({required Player white, required Player black});
}

class CreateGameImp extends CreateGame {
  final GameRepository repository;
  CreateGameImp(this.repository);
  @override
  Either<Failure, Game> call({required Player white, required Player black}) {
    if (white.cor == black.cor) {
      return Left(InvalidPlayer());
    }
    return repository.createGame(white: white, black: black);
  }
}
