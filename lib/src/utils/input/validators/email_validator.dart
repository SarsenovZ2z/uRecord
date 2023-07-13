import 'package:urecord/src/utils/input/validators/input_validator.dart';

class EmailValidator implements InputValidator<String> {
  final String regex;

  const EmailValidator({
    this.regex =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  });

  @override
  String? validate(String? email, {String? errorText}) {
    return RegExp(regex).hasMatch(email ?? '')
        ? null
        : (errorText ?? 'Please enter valid email address');
  }
}
