// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchStore on _MatchStoreBase, Store {
  Computed<String>? _$whiteTimeComputed;

  @override
  String get whiteTime =>
      (_$whiteTimeComputed ??= Computed<String>(() => super.whiteTime,
              name: '_MatchStoreBase.whiteTime'))
          .value;
  Computed<String>? _$blackTimeComputed;

  @override
  String get blackTime =>
      (_$blackTimeComputed ??= Computed<String>(() => super.blackTime,
              name: '_MatchStoreBase.blackTime'))
          .value;

  late final _$gameAtom = Atom(name: '_MatchStoreBase.game', context: context);

  @override
  Game? get game {
    _$gameAtom.reportRead();
    return super.game;
  }

  @override
  set game(Game? value) {
    _$gameAtom.reportWrite(value, super.game, () {
      super.game = value;
    });
  }

  late final _$currentPlayerAtom =
      Atom(name: '_MatchStoreBase.currentPlayer', context: context);

  @override
  Cor get currentPlayer {
    _$currentPlayerAtom.reportRead();
    return super.currentPlayer;
  }

  @override
  set currentPlayer(Cor value) {
    _$currentPlayerAtom.reportWrite(value, super.currentPlayer, () {
      super.currentPlayer = value;
    });
  }

  late final _$startedAtom =
      Atom(name: '_MatchStoreBase.started', context: context);

  @override
  bool get started {
    _$startedAtom.reportRead();
    return super.started;
  }

  @override
  set started(bool value) {
    _$startedAtom.reportWrite(value, super.started, () {
      super.started = value;
    });
  }

  late final _$subtractTimeAsyncAction =
      AsyncAction('_MatchStoreBase.subtractTime', context: context);

  @override
  Future<void> subtractTime(SubtractPlayerClock subtract) {
    return _$subtractTimeAsyncAction.run(() => super.subtractTime(subtract));
  }

  late final _$_MatchStoreBaseActionController =
      ActionController(name: '_MatchStoreBase', context: context);

  @override
  void startGame(CreateGame constructor) {
    final _$actionInfo = _$_MatchStoreBaseActionController.startAction(
        name: '_MatchStoreBase.startGame');
    try {
      return super.startGame(constructor);
    } finally {
      _$_MatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passTurn(PassTurn turnPasser, SubtractPlayerClock subtractor) {
    final _$actionInfo = _$_MatchStoreBaseActionController.startAction(
        name: '_MatchStoreBase.passTurn');
    try {
      return super.passTurn(turnPasser, subtractor);
    } finally {
      _$_MatchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
game: ${game},
currentPlayer: ${currentPlayer},
started: ${started},
whiteTime: ${whiteTime},
blackTime: ${blackTime}
    ''';
  }
}
