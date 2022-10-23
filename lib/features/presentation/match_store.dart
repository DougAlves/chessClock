import 'dart:async';

import 'package:chess_clock/features/domain/entities/game.dart';
import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/usecases/create_game.dart';
import 'package:chess_clock/features/domain/usecases/pass_turn.dart';
import 'package:chess_clock/features/domain/usecases/subtract_player_clock.dart';
import 'package:mobx/mobx.dart';
part 'match_store.g.dart';

// ignore: library_private_types_in_public_api
class MatchStore = _MatchStoreBase with _$MatchStore;

abstract class _MatchStoreBase with Store {
  @observable
  Game? game;

  @observable
  Cor currentPlayer = Cor.brancas;

  @observable
  bool started = false;

  Timer? timer;

  @computed
  String get whiteTime {
    final String? minutes =
        game?.white.timeLeft.inMinutes.toString().padLeft(2, '0');
    final String? seconds =
        game?.white.timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0');
    return minutes != null ? ('$minutes:$seconds') : '00:00';
  }

  @computed
  String get blackTime {
    final String? minutes =
        game?.black.timeLeft.inMinutes.toString().padLeft(2, '0');
    final String? seconds =
        game?.black.timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0');
    return minutes != null ? ('$minutes:$seconds') : '00:00';
  }

  @action
  Future<void> subtractTime(SubtractPlayerClock subtract) async {
    switch (game!.currentPlayer) {
      case Cor.brancas:
        final result = await subtract(game!.white);
        if (result.isRight()) {
          game = Game(
              white: result.getOrElse(() => game!.white),
              black: game!.black,
              currentPlayer: game!.currentPlayer);
        }
        break;
      case Cor.pretas:
        final result = await subtract(game!.black);
        if (result.isRight()) {
          game = Game(
              white: game!.white,
              black: result.getOrElse(() => game!.black),
              currentPlayer: game!.currentPlayer);
        }
        break;
    }
  }

  @action
  void startGame(CreateGame constructor) {
    final results = constructor(
        white: Player(cor: Cor.brancas, timeLeft: const Duration(minutes: 3)),
        black: Player(cor: Cor.pretas, timeLeft: const Duration(minutes: 3)));
    if (results.isRight()) {
      game = results.fold((l) => null, (gameBuilt) => gameBuilt);
    }
    started = true;
  }

  @action
  void passTurn(PassTurn turnPasser, SubtractPlayerClock subtractor) {
    timer?.cancel();
    game = turnPasser(game!);

    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      subtractTime(subtractor);
    });
  }
}
