part of 'util.dart';

class SharedPreferencesUtil {
  static Future<SharedPreferences> get instance async => await SharedPreferences.getInstance();

  static Future<String?> getString({required String key}) =>
      instance.then((prefs) => prefs.getString(key));

  static Future<bool> setString({required String key, required String value}) =>
      instance.then((prefs) async => await prefs.setString(key, value));

  static Future<bool> setInt({required String key, required int value}) =>
      instance.then((prefs) async => await prefs.setInt(key, value));

  static Future<int?> getInt({required String key}) async =>
      instance.then((prefs) => prefs.getInt(key));

  static Future<bool> setBool({required String key, required bool value}) =>
      instance.then((prefs) async => await prefs.setBool(key, value));

  static Future<bool?> getBool({required String key}) =>
      instance.then((prefs) => prefs.getBool(key));

  static Future<bool> remove({required String key}) =>
      instance.then((prefs) async => await prefs.remove(key));
}

class SharedPreferencesKey {
  static const String token = 'token';
}
