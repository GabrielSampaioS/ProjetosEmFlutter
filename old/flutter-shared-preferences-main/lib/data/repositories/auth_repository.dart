import 'package:sqlite_offline/data/storage/local_storage.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<String?> getUsername();
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<void> saveAuthState(bool isLoggedIn, String? username);
}

class MockAuthRepository implements AuthRepository {
  // dependenciesInjection
  final LocalStorage localStorage;
  MockAuthRepository({required this.localStorage});

  final String isLoggedStoragekey = "isLoggedKey";
  final String userNameStorageKey = 'userNameKey';
  bool _isLoggedIn = false;
  String? _username;

  @override
  Future<bool> isLoggedIn() async {
    final result = await localStorage.getData(key: isLoggedStoragekey);
    _isLoggedIn = result == "true";
    return _isLoggedIn;
  }

  @override
  Future<String?> getUsername() async {
    final result = await localStorage.getData(key: userNameStorageKey);
    _username = result;
    return _username;
  }

  @override
  Future<bool> login(String email, String password) async {
    // Simulação de login mockado
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      _username = email.split('@').first;

      await saveAuthState(_isLoggedIn, _username);
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
    _username = null;

    await saveAuthState(_isLoggedIn, _username);
  }

  @override
  Future<void> saveAuthState(bool isLoggedIn, String? username) async {
    await localStorage.create(key: isLoggedStoragekey, data: _isLoggedIn);
    await localStorage.create(key: userNameStorageKey, data: username);

    _isLoggedIn = isLoggedIn;
    _username = username;
  }
}
