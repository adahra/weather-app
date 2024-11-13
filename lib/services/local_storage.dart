import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalStorage {
  Future<void> init();

  bool get isCelcius;
  Future<void> saveIsCelcius(bool value);
}

class SharedPrefsStorage implements LocalStorage {
  static const isCelciusKey = 'isCelcius';
  static const latitudeKey = 'latitude';
  static const longitudeKey = 'longitude';

  late SharedPreferences prefs;

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  bool get isCelcius => prefs.getBool(isCelciusKey) ?? true;

  @override
  Future<void> saveIsCelcius(bool value) async {
    await prefs.setBool(isCelciusKey, value);
  }
}
