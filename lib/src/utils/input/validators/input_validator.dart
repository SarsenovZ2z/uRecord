abstract class InputValidator<T> {
  String? validate(T? value, {String? errorText});
}