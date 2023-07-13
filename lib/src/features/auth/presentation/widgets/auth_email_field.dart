import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:urecord/src/utils/input/validators/email_validator.dart';

class AuthEmailField extends StatelessWidget {
  final TextEditingController controller;

  const AuthEmailField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: const Icon(CupertinoIcons.at),
      child: CupertinoTextFormFieldRow(
        controller: controller,
        placeholder: 'Email',
        padding: const EdgeInsets.symmetric(vertical: 6),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
        validator: (String? value) {
          return const EmailValidator().validate(value);
        },
      ),
    );
  }
}
