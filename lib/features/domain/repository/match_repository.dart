import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/match.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:dartz/dartz.dart';

abstract class MatchRepository {
  Either<Failure, Match> createMatch(
      {required Player white, required Player black, required int bestOf});
}
