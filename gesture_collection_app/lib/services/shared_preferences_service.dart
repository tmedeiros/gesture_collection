import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>(create: (ref) => throw UnimplementedError());

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const fooKey = 'fooBoolTest';
  static const uidKey = 'userId';

  Future<void> setFooBoolTest() async {
    await sharedPreferences.setBool(fooKey, true);
  }

  bool isFooBoolTest() =>
      sharedPreferences.getBool(fooKey) ?? false;

  Future<void> setUID(String uid) async {
    await sharedPreferences.setString(uidKey, uid);
  }

  String getUID() =>
      sharedPreferences.getString(uidKey);
}