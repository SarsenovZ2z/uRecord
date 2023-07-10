import 'package:get_it/get_it.dart';
import 'package:urecord/src/common/service_provider.dart';
import 'package:urecord/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:urecord/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:urecord/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:urecord/src/features/auth/domain/usecases/login.dart';
import 'package:urecord/src/features/auth/domain/usecases/login_by_token.dart';
import 'package:urecord/src/features/auth/domain/usecases/logout.dart';
import 'package:urecord/src/features/auth/domain/usecases/register.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_cubit.dart';

class AuthServiceProvider extends ServiceProvider {
  const AuthServiceProvider();

  @override
  void registerBlocs() {
    GetIt.instance.registerFactory<AuthCubit>(
      () => AuthCubit(
        performRegister: GetIt.instance(),
        performLogin: GetIt.instance(),
        performLoginByToken: GetIt.instance(),
        performLogout: GetIt.instance(),
      ),
    );
  }

  @override
  void registerDataSources() {
    GetIt.instance.registerFactory<AuthDataSource>(
      () => RemoteAuthDataSource(
        api: GetIt.instance(),
        secureStorage: GetIt.instance(),
      ),
    );
  }

  @override
  void registerRepositories() {
    GetIt.instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authDataSource: GetIt.instance(),
      ),
    );
  }

  @override
  void registerUseCases() {
    GetIt.instance.registerFactory<Login>(
      () => Login(
        authRepository: GetIt.instance(),
      ),
    );

    GetIt.instance.registerFactory<LoginByToken>(
      () => LoginByToken(
        authRepository: GetIt.instance(),
      ),
    );

    GetIt.instance.registerFactory<Register>(
      () => Register(
        authRepository: GetIt.instance(),
      ),
    );

    GetIt.instance.registerFactory<Logout>(
      () => Logout(
        authRepository: GetIt.instance(),
      ),
    );
  }
}
