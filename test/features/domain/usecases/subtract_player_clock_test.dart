import 'package:chess_clock/core/errors/failure.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/usecases/subtract_player_clock.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SubtractPlayerClock subtrackClock;

  setUp(() {
    subtrackClock = SubtractPlayerClockImp();
  });

  test('Deve subtrait 500 ms do tempo restante sem dar problema', () async {
    Player player =
        Player(cor: Cor.brancas, timeLeft: const Duration(seconds: 10));
    final results = await subtrackClock(player);

    expect(results.fold(id, (player) => player.timeLeft),
        player.timeLeft - const Duration(milliseconds: 500));
  });

  test('Deve retornar um left porque o player perde no tempo', () async {
    Player player =
        Player(cor: Cor.brancas, timeLeft: const Duration(milliseconds: 100));
    final results = await subtrackClock(player);
    expect(results, isA<Left>());
    expect(results.fold(id, id), isA<TimeEnded>());
  });
}
