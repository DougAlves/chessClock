import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:dartz/dartz.dart';

abstract class PlayerRepository {
  Future<Either<Failure, Player>> getPlayer(Cor cor, Duration time);
}
