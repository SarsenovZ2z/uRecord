import 'package:shared_preferences/shared_preferences.dart';
import 'package:urecord/src/utils/http/api.dart';

class MixedDataSource {
  final Api api;
  final SharedPreferences sharedPreferences;

  const MixedDataSource({
    required this.api,
    required this.sharedPreferences,
  });
}
