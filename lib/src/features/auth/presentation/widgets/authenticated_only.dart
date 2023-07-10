import 'package:flutter/cupertino.dart';

class AuthenticatedOnly extends StatelessWidget {
  final Widget child;

  const AuthenticatedOnly({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
