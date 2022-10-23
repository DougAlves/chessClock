import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:dartz/dartz.dart';

abstract class SubtractPlayerClock {
  Future<Either<Failure, Player>> call(Player player);
}

class SubtractPlayerClockImp extends SubtractPlayerClock {
  @override
  Future<Either<Failure, Player>> call(Player player) async {
    if (player.timeLeft > const Duration(milliseconds: 500)) {
      Player nPlayer = Player(
          cor: player.cor,
          timeLeft: player.timeLeft - const Duration(milliseconds: 500));
      return Right(nPlayer);
    } else {
      return Left(TimeEnded());
    }
  }
}
