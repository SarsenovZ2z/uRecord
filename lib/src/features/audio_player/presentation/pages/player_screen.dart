import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: AudioPlayerWidget(),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    //
  }

  void play() async {
    const url =
        'https://music.z2z.kz/uploads/test.mp3';
    await player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SafeArea(
            child: CupertinoButton.filled(
              // onPressed: play,
              onPressed: () {
                context.push('/test');
              },
              child: const Text('play'),
            ),
          ),
        ],
      ),
    );
  }
}
