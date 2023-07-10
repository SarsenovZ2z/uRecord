import 'package:flutter/cupertino.dart';
import 'package:urecord/src/common/presentation/pages/home_screen.dart';
import 'package:urecord/src/themes/light_theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'uRecord',
      theme: lightTheme,
      home: HomeScreen(),
    );
  }
}