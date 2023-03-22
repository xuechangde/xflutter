import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpService extends GetxService {
  static SpService get to => Get.find();
  late final SharedPreferences _prefs;

  Future<SpService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  Future<bool> setObject(String key, dynamic value) async {
    var obj = {'object': value};
    var json = jsonEncode(obj);
    return await _prefs.setString(key, json);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  dynamic getObject(String key) {
    dynamic result = _prefs.getString(key);
    if (null == result) {
      return null;
    }
    var json = jsonDecode(result);
    return json['object'];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
