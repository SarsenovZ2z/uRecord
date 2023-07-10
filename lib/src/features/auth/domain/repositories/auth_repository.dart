import 'package:dartz/dartz.dart';
import 'package:urecord/src/common/domain/entities/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> loginByToken();

  Future<Either<Failure, void>> register({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();
}
