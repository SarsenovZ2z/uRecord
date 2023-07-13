import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(),
          _Content(),
        ],
      ),
    );
  }
}


class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverList.list(children: [
        const Text('Not implemented yet 😇'),
        const SizedBox(height: 20),
        CupertinoButton.filled(
          onPressed: () {
            context.pop(true);
          },
          child: const Text('Continue'),
        ),
      ]),
    );
  }
}
