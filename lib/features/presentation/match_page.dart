import 'package:chess_clock/features/domain/entities/player.dart';
import 'package:chess_clock/features/domain/usecases/create_game.dart';
import 'package:chess_clock/features/domain/usecases/pass_turn.dart';
import 'package:chess_clock/features/domain/usecases/subtract_player_clock.dart';
import 'package:chess_clock/features/presentation/match_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    final matchStore = Provider.of<MatchStore>(context);
    final createGame = Provider.of<CreateGame>(context);
    final passTurn = Provider.of<PassTurn>(context);
    final subtractor = Provider.of<SubtractPlayerClock>(context);

    return Scaffold(
      body: Column(
        children: [
          Observer(builder: (context) {
            return GestureDetector(
              onTap: matchStore.game != null &&
                      matchStore.game!.currentPlayer == Cor.pretas
                  ? () => matchStore.passTurn(passTurn, subtractor)
                  : null,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Observer(builder: (context) {
                    return RotatedBox(
                      quarterTurns: 2,
                      child: Text(
                        matchStore.blackTime,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    );
                  }),
                ),
              ),
            );
          }),
          Observer(builder: (context) {
            return GestureDetector(
              onTap: !matchStore.started ||
                      matchStore.game!.currentPlayer == Cor.brancas
                  ? () {
                      print('ola');

                      if (!matchStore.started) {
                        matchStore.startGame(createGame);
                      }
                      matchStore.passTurn(passTurn, subtractor);
                    }
                  : null,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                  child: Observer(builder: (context) {
                    return Text(
                      matchStore.whiteTime,
                      style: const TextStyle(color: Colors.black, fontSize: 40),
                    );
                  }),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
