import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/match.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/repository/match_repository.dart';
import 'package:chess_clock/features/domain/usecases/create_match.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_match_test.mocks.dart';

@GenerateMocks([MatchRepository])
void main() {
  late MockMatchRepository matchRepository;
  late CreateMatch usecase;
  setUp(() {
    matchRepository = MockMatchRepository();
    usecase = CreateMatchImp(matchRepository);
  });

  test('Deve Retornar uma partida valida', () {
    Player white =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    Player black =
        Player(cor: Cor.pretas, timeLeft: const Duration(minutes: 3));
    int bestOf = 3;

    when(matchRepository.createMatch(
            white: anyNamed('white'),
            black: anyNamed('black'),
            bestOf: anyNamed('bestOf')))
        .thenAnswer((realInvocation) =>
            Right(Match(bestOf: bestOf, white: white, black: black)));
    final results = usecase(white: white, black: black, bestOf: bestOf);
    expect(results, isA<Right>());
    verify(matchRepository.createMatch(
        white: white, black: black, bestOf: bestOf));
  });

  test('Deve dar erro quando passamos 2 players da mesma cor', () async {
    Player white =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    Player white2 =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    final results = usecase(white: white, black: white2, bestOf: 3);
    expect(results.isLeft(), true);
    expect(results.fold(id, id), isA<InvalidPlayer>());
  });

  test('Deve dar erro mandamos numero negativo no bestOf', () async {
    Player white =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    Player black =
        Player(cor: Cor.pretas, timeLeft: const Duration(minutes: 3));
    final results = usecase(white: white, black: black, bestOf: -1);
    expect(results.isLeft(), true);
    expect(results.fold(id, id), isA<NonPositiveTotalMatches>());
  });
}
