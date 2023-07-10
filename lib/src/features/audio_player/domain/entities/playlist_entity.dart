import 'package:equatable/equatable.dart';
import 'package:urecord/src/features/audio_player/domain/entities/audio_entity.dart';

class PlaylistEntity extends Equatable {
  final String name;
  final List<AudioEntity> items;

  const PlaylistEntity({
    required this.name,
    required this.items,
  });

  @override
  List<Object?> get props => [
        name,
        items,
      ];
}
