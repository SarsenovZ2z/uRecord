import 'package:equatable/equatable.dart';
import 'package:urecord/src/features/audio_player/domain/entities/audio_entity.dart';

class RemoteAudioEntity extends Equatable implements AudioEntity {
  final String url;

  const RemoteAudioEntity({
    required this.url,
  });

  @override
  List<Object?> get props => [
    url,
  ];
}
