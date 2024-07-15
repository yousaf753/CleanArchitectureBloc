

class LoginData {
  // This class is basically an entity

  var _username = "";
  var _password = "";

  LoginData();

  LoginData setUsername(String value) {
    _username = value;
    return this;
  }

  LoginData setPassword(String value) {
    _password = value;
    return this;
  }

  String get getUserName => _username;

  String get getPassword => _password;
}
