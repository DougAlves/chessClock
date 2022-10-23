import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/repository/game_repository.dart';
import 'package:chess_clock/features/domain/usecases/create_game.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_game_test.mocks.dart';

@GenerateMocks([GameRepository])
void main() {
  late MockGameRepository gameRepository;
  late CreateGame usecase;
  setUp(() {
    gameRepository = MockGameRepository();
    usecase = CreateGameImp(gameRepository);
  });

  test('Deve Retornar uma partida valida', () {
    Player white =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    Player black =
        Player(cor: Cor.pretas, timeLeft: const Duration(minutes: 3));
    when(gameRepository.createGame(
      white: anyNamed('white'),
      black: anyNamed('black'),
    )).thenAnswer((realInvocation) => Right(Game(white: white, black: black)));
    final results = usecase(white: white, black: black);
    expect(results, isA<Right>());
    verify(gameRepository.createGame(white: white, black: black));
  });

  test('Deve dar erro quando passamos 2 players da mesma cor', () async {
    Player white =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    Player white2 =
        Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3));
    final results = usecase(white: white, black: white2);
    expect(results.isLeft(), true);
    expect(results.fold(id, id), isA<InvalidPlayer>());
  });
}
