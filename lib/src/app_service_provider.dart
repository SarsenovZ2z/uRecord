import 'package:get_it/get_it.dart';
import 'package:urecord/src/common/service_provider.dart';
import 'package:urecord/src/utils/http/api.dart';
import 'package:urecord/src/utils/http/dio_api.dart';

class AppServiceProvider extends ServiceProvider {
  const AppServiceProvider();

  @override
  void registerUtils() {
    GetIt.instance.registerLazySingleton<Api>(
      () => DioApi(),
    );
  }

  @override
  void registerBlocs() {
    // TODO: implement registerBlocs
  }

  @override
  void registerDataSources() {
    // TODO: implement registerDataSources
  }

  @override
  void registerRepositories() {
    // TODO: implement registerRepositories
  }

  @override
  void registerUseCases() {
    // TODO: implement registerUseCases
  }
}
