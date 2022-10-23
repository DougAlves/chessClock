import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/repository/player_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetPlayer {
  Future<Either<Failure, Player>> call(Cor cor, Duration timeLeft);
}

class GetPlayerImp extends GetPlayer {
  final PlayerRepository repository;
  GetPlayerImp(this.repository) : super();
  @override
  Future<Either<Failure, Player>> call(Cor cor, Duration timeLeft) async {
    return await repository.getPlayer(cor, timeLeft);
  }
}
