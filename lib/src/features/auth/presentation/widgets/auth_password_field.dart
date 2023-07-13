import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AuthPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const AuthPasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<AuthPasswordField> createState() => AuthPasswordFieldState();
}

class AuthPasswordFieldState extends State<AuthPasswordField> {
  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: const Icon(CupertinoIcons.lock),
      child: CupertinoTextFormFieldRow(
        controller: widget.controller,
        placeholder: 'Password',
        padding: const EdgeInsets.symmetric(vertical: 6),
        obscureText: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofillHints: const [AutofillHints.password],
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
        validator: (String? value) {
          return (value?.isEmpty ?? true) ? 'Enter password' : null;
        },
      ),
    );
  }
}
