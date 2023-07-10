import 'package:equatable/equatable.dart';
import 'package:urecord/src/common/domain/entities/failure.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class NotAuthenticatedState extends AuthState {
  const NotAuthenticatedState();
}

class AuthenticatingState extends AuthState {
  const AuthenticatingState();
}

class AuthenticatingByTokenState extends AuthenticatingState {
  const AuthenticatingByTokenState();
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState();
}

class AuthenticationFailedState extends NotAuthenticatedState {
  final Failure failure;

  const AuthenticationFailedState(this.failure);

  @override
  List<Object?> get props => [
        failure,
      ];
}
