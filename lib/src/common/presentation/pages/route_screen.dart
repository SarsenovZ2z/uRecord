import 'package:flutter/cupertino.dart';

class RouteScreen extends StatelessWidget {

  final Widget child;

  const RouteScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
