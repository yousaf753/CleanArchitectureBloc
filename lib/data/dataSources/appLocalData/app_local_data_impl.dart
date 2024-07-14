import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataImpl extends AppLocalData {
  AppLocalDataImpl._();

  static AppLocalDataImpl? _instance;

  static AppLocalDataImpl getInstance() {
    _instance ??= AppLocalDataImpl._();
    return _instance!;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /////KEYS
  static const String _userToken = "userToken";
  /////

  @override
  Future clearAllData() async{
    SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(_userToken) ?? "";
  }

  @override
  Future setToken(String token) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(_userToken, token);
  }
}
