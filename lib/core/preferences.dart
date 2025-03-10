import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  void clear() {
    _sharedPreferences?.clear();
  }

  String getCreateData (int id) {
    return _sharedPreferences?.getString(id.toString()) ?? "";
  }

  void setCreateDate(int id,String value) {
    _sharedPreferences?.setString(id.toString(),value);
  }



}
