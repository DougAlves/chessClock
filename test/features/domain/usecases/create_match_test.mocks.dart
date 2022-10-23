// Mocks generated by Mockito 5.3.2 from annotations
// in chess_clock/test/features/domain/usecases/create_match_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chess_clock/core/errors/failure.dart' as _i4;
import 'package:chess_clock/features/domain/entities/match.dart' as _i5;
import 'package:chess_clock/features/domain/entities/player.dart' as _i6;
import 'package:chess_clock/features/domain/repository/match_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MatchRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMatchRepository extends _i1.Mock implements _i3.MatchRepository {
  MockMatchRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Either<_i4.Failure, _i5.Match> createMatch({
    required _i6.Player? white,
    required _i6.Player? black,
    required int? bestOf,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createMatch,
          [],
          {
            #white: white,
            #black: black,
            #bestOf: bestOf,
          },
        ),
        returnValue: _FakeEither_0<_i4.Failure, _i5.Match>(
          this,
          Invocation.method(
            #createMatch,
            [],
            {
              #white: white,
              #black: black,
              #bestOf: bestOf,
            },
          ),
        ),
      ) as _i2.Either<_i4.Failure, _i5.Match>);
}
