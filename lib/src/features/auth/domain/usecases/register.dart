import 'package:dartz/dartz.dart';
import 'package:urecord/src/common/domain/entities/failure.dart';
import 'package:urecord/src/common/domain/usecases/usecase.dart';
import 'package:urecord/src/features/auth/domain/repositories/auth_repository.dart';

class Register extends UseCase<Either<Failure, void>, RegisterParams> {
  final AuthRepository authRepository;

  const Register({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return authRepository.register(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String name;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
