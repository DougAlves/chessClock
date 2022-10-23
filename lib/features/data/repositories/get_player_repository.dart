import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/repository/player_repository.dart';
import 'package:dartz/dartz.dart';

class PlayerRepositoryImp extends PlayerRepository {
  @override
  Future<Either<Failure, Player>> getPlayer(Cor cor, Duration time) async {
    return Right(Player(cor: cor, timeLeft: time));
  }
}
