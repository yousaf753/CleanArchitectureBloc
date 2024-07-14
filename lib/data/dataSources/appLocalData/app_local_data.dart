
abstract class AppLocalData{
  Future setToken(String token);

  Future<String> getToken();

  Future clearAllData();
}