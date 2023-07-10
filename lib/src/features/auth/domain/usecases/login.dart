import 'package:dartz/dartz.dart';
import 'package:urecord/src/common/domain/entities/failure.dart';
import 'package:urecord/src/common/domain/usecases/usecase.dart';
import 'package:urecord/src/features/auth/domain/repositories/auth_repository.dart';

class Login implements UseCase<Either<Failure, void>, LoginParams> {
  final AuthRepository authRepository;

  const Login({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(LoginParams params) {
    return authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });
}
