import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urecord/src/common/presentation/controllers/safe_cubit.dart';
import 'package:urecord/src/features/auth/domain/usecases/login.dart';
import 'package:urecord/src/features/auth/domain/usecases/login_by_token.dart';
import 'package:urecord/src/features/auth/domain/usecases/logout.dart';
import 'package:urecord/src/features/auth/domain/usecases/register.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_states.dart';

class AuthCubit extends SafeCubit<AuthState> {
  final Register performRegister;
  final Login performLogin;
  final LoginByToken performLoginByToken;
  final Logout performLogout;

  AuthCubit({
    required this.performRegister,
    required this.performLogin,
    required this.performLoginByToken,
    required this.performLogout,
  }) : super(const NotAuthenticatedState());

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    return (await performRegister(
      RegisterParams(
        email: email,
        password: password,
      ),
    ))
        .fold(
      (failure) => false,
      (_) => true,
    );
  }

  Future<bool?> login({
    required String email,
    required String password,
  }) async {
    if (state is AuthenticatingState) return null;

    emit(const AuthenticatingState());

    return (await performLogin(
      LoginParams(email: email, password: password),
    ))
        .fold(
      (failure) {
        emit(AuthenticationFailedState(failure));
        return false;
      },
      (_) {
        emit(const AuthenticatedState());
        return true;
      },
    );
  }

  Future<bool?> loginByToken() async {
    if (state is AuthenticatingState) return null;

    emit(const AuthenticatingByTokenState());

    return (await performLoginByToken()).fold(
      (failure) {
        emit(const NotAuthenticatedState());
        return false;
      },
      (_) {
        emit(const AuthenticatedState());
        return true;
      },
    );
  }

  Future<bool> logout() async {
    return (await performLogout()).fold(
      (failure) {
        emit(const NotAuthenticatedState());
        return false;
      },
      (_) {
        emit(const NotAuthenticatedState());
        return true;
      },
    );
  }
}
