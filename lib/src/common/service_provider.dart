abstract class ServiceProvider {

  const ServiceProvider();

  void registerUtils() {

  }

  void registerBlocs();

  void registerUseCases();

  void registerRepositories();

  void registerDataSources();

  void register() {
    registerUtils();
    registerBlocs();
    registerUseCases();
    registerRepositories();
    registerDataSources();
  }
}