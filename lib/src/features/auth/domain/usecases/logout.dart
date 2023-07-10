import 'package:dartz/dartz.dart';
import 'package:urecord/src/common/domain/entities/failure.dart';
import 'package:urecord/src/common/domain/usecases/usecase.dart';
import 'package:urecord/src/features/auth/domain/repositories/auth_repository.dart';

class Logout extends UseCaseWithoutParams<Either<Failure, void>> {
  final AuthRepository authRepository;

  const Logout({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call() {
    return authRepository.logout();
  }
}
