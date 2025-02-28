// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _serviceNameKey = 'serviceName';
  static const String _timeKey = 'time';
  static const String _dateKey = 'date';
  static const String _locationKey = 'location';

  static Future<void> saveServiceName(String serviceName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_serviceNameKey, serviceName);
  }

  static Future<String> getServiceName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_serviceNameKey) ?? 'أسم الخدمة';
  }

  static Future<void> saveTime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_timeKey, time);
  }

  static Future<String> getTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_timeKey) ?? '9:00 - 11:00 صباحا';
  }

  static Future<void> saveDate(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dateKey, date);
  }

  static Future<String> getDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_dateKey) ?? 'الأربعاء 12 نوفمبر , 2024';
  }

  static Future<void> saveLocation(String location) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_locationKey, location);
  }

  static Future<String> getLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_locationKey) ??
        'المنصورة شارع الترعة بجوار محل البغل';
  }
}
