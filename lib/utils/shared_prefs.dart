// ignore_for_file: non_constant_identifier_names

import 'package:face_off/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  int get id => _sharedPrefs.getInt(Keys.key_id) ?? -1;
  set id(int value) {
    _sharedPrefs.setInt(Keys.key_id, value);
  }

  String get phone_number => _sharedPrefs.getString(Keys.key_phonenumber) ?? "";
  set phone_number(String value) {
    _sharedPrefs.setString(Keys.key_phonenumber, value);
  }

  // String get dob => _sharedPrefs.getString(Keys.key_dob) ?? "";
  // set dob(String value) {
  //   _sharedPrefs.setString(Keys.key_dob, value);
  // }

  String get first_name => _sharedPrefs.getString(Keys.key_firstname) ?? "";
  set first_name(String value) {
    _sharedPrefs.setString(Keys.key_firstname, value);
  }

  String get last_name => _sharedPrefs.getString(Keys.key_lastname) ?? "";
  set last_name(String value) {
    _sharedPrefs.setString(Keys.key_lastname, value);
  }

  String get gender => _sharedPrefs.getString(Keys.key_gender) ?? "";
  set gender(String value) {
    _sharedPrefs.setString(Keys.key_gender, value);
  }

  bool get is_first_open => _sharedPrefs.getBool(Keys.key_isfirstopen) ?? true;
  set is_first_name(bool value) {
    _sharedPrefs.setBool(Keys.key_isfirstopen, value);
  }
}
