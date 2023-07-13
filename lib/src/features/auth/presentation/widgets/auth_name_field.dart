import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AuthNameField extends StatelessWidget {
  final TextEditingController controller;

  const AuthNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: const Icon(CupertinoIcons.person),
      child: CupertinoTextFormFieldRow(
        controller: controller,
        placeholder: 'Your Name',
        padding: const EdgeInsets.symmetric(vertical: 6),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
        validator: (String? value) {
          return (value?.isEmpty ?? true) ? 'Please, enter your name' : null;
        },
      ),
    );
  }
}