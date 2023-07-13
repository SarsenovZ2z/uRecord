import 'package:dartz/dartz.dart';
import 'package:urecord/src/common/domain/entities/failure.dart';
import 'package:urecord/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:urecord/src/features/auth/domain/entities/auth_token_entity.dart';
import 'package:urecord/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  const AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<Failure, void>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await authDataSource.register(
        email: email,
        password: password,
        name: name,
      );
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authToken = await authDataSource.login(
        email: email,
        password: password,
      );

      await Future.wait([
        authDataSource.storeAuthToken(authToken),
        authDataSource.setAuthToken(authToken),
      ]);

      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> loginByToken() async {
    try {
      final AuthTokenEntity? authToken = await authDataSource.getAuthToken();

      if (authToken is! AuthTokenEntity) {
        throw UnexpectedFailure('AuthToken not found!');
      }

      await authDataSource.setAuthToken(authToken);

      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await authDataSource.logout());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }
}
