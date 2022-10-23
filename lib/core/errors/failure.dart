abstract class Failure {}

class InvalidPlayer extends Failure {
  String message = "Both players have the same color";
}

class NonPositiveTotalMatches extends Failure {
  late String message;
  final int arg;
  NonPositiveTotalMatches(this.arg) {
    message = 'Unable to create a match with $arg games';
  }
}

class TimeEnded extends Failure {}
