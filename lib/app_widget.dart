import 'package:chess_clock/features/data/repositories/create_game_repository.dart';
import 'package:chess_clock/features/data/repositories/create_match_repository.dart';
import 'package:chess_clock/features/data/repositories/get_player_repository.dart';
import 'package:chess_clock/features/domain/repository/game_repository.dart';
import 'package:chess_clock/features/domain/repository/match_repository.dart';
import 'package:chess_clock/features/domain/repository/player_repository.dart';
import 'package:chess_clock/features/domain/usecases/create_game.dart';
import 'package:chess_clock/features/domain/usecases/create_match.dart';
import 'package:chess_clock/features/domain/usecases/finish_game.dart';
import 'package:chess_clock/features/domain/usecases/finish_match_game.dart';
import 'package:chess_clock/features/domain/usecases/get_player.dart';
import 'package:chess_clock/features/domain/usecases/pass_turn.dart';
import 'package:chess_clock/features/domain/usecases/subtract_player_clock.dart';
import 'package:chess_clock/features/presentation/match_page.dart';
import 'package:chess_clock/features/presentation/match_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PlayerRepository>(create: (_) => PlayerRepositoryImp()),
        Provider<MatchRepository>(create: (_) => MatchRepositoryImp()),
        Provider<GameRepository>(create: (_) => GameRepositoryImp()),
        Provider<SubtractPlayerClock>(create: (_) => SubtractPlayerClockImp()),
        Provider<FinishGame>(create: (_) => FinishGameImp()),
        Provider<MatchStore>(create: (_) => MatchStore()),
        Provider<GetPlayer>(
            create: (_) => GetPlayerImp(_.read<PlayerRepository>())),
        Provider<CreateMatch>(
            create: (_) => CreateMatchImp(_.read<MatchRepository>())),
        Provider<CreateGame>(
            create: (_) => CreateGameImp(_.read<GameRepository>())),
        Provider<FinishGameMatch>(
            create: (_) => FinishGameMatchImp(_.read<FinishGame>())),
        Provider<PassTurn>(
          create: (_) => PassTurnImp(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MatchPage(),
      ),
    );
  }
}
