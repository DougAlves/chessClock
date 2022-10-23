import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/repository/game_repository.dart';
import 'package:dartz/dartz.dart';

class GameRepositoryImp extends GameRepository {
  @override
  Either<Failure, Game> createGame(
      {required Player white, required Player black}) {
    return Right(Game(black: black, white: white));
  }
}
