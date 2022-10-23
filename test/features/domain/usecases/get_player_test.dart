import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/repository/player_repository.dart';
import 'package:chess_clock/features/domain/usecases/get_player.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_player_test.mocks.dart';

@GenerateMocks([PlayerRepository])
void main() {
  late MockPlayerRepository playerRepository;
  late GetPlayer useCase;
  const Duration tDuration = Duration(seconds: 1);
  const Cor cor = Cor.brancas;
  final tplayer = Player(cor: cor, timeLeft: tDuration);

  setUp(() {
    playerRepository = MockPlayerRepository();
    useCase = GetPlayerImp(playerRepository);
  });

  test('Deve criar um player novo', () async {
    when(playerRepository.getPlayer(any, any))
        .thenAnswer((_) async => Right(Player(cor: cor, timeLeft: tDuration)));
    final result = await useCase(cor, tDuration);
    expect(result, isA<Right<Failure, Player>>());
    verify(playerRepository.getPlayer(cor, tDuration));
  });
}
