import 'package:get_it/get_it.dart';
import 'package:urecord/src/app_service_provider.dart';
import 'package:urecord/src/features/audio_player/audio_player_service_provider.dart';
import 'package:urecord/src/common/service_provider.dart';

Future<void> init() async {

  const services = <ServiceProvider>[
    AppServiceProvider(),
    AudioPlayerServiceProvider(),
  ];

  for (var serviceProvider in services) {
    serviceProvider.register();
  }

  return GetIt.instance.allReady();
}