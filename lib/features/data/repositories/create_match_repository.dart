import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/entities/match.dart';
import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/repository/match_repository.dart';
import 'package:dartz/dartz.dart';

class MatchRepositoryImp extends MatchRepository {
  @override
  Either<Failure, Match> createMatch(
      {required Player white, required Player black, required int bestOf}) {
    return Right(Match(white: white, black: black, bestOf: bestOf));
  }
}
