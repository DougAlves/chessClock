import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/match.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/repository/match_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateMatch {
  Either<Failure, Match> call(
      {required Player white, required Player black, required int bestOf});
}

class CreateMatchImp extends CreateMatch {
  final MatchRepository repository;
  CreateMatchImp(this.repository);
  @override
  Either<Failure, Match> call(
      {required Player white, required Player black, required int bestOf}) {
    if (white.cor == black.cor) {
      return Left(InvalidPlayer());
    }

    if (bestOf <= 0) {
      return Left(NonPositiveTotalMatches(bestOf));
    }

    return repository.createMatch(white: white, black: black, bestOf: bestOf);
  }
}
