import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable implements Exception {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class UnexpectedFailure extends Failure {
  final Object e;

  UnexpectedFailure(this.e) : super(e.toString()) {
    debugPrint(e.toString());
  }
}
