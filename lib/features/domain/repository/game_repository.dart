import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:dartz/dartz.dart';

abstract class GameRepository {
  Either<Failure, Game> createGame(
      {required Player white, required Player black});
}
