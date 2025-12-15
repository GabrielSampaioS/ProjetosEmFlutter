import 'package:flutter/material.dart';
import '../../../domain/use_cases/auth/check_auth_state_use_case.dart';
import '../../../domain/use_cases/auth/get_username_use_case.dart';
import '../../../domain/use_cases/auth/login_use_case.dart';
import '../../../domain/use_cases/auth/logout_use_case.dart';

class AuthViewModel extends ChangeNotifier {
  final CheckAuthStateUseCase _checkAuthStateUseCase;
  final GetUsernameUseCase _getUsernameUseCase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  bool _isLoggedIn = false;
  String? _username;
  bool _isLoading = false;

  AuthViewModel({
    required CheckAuthStateUseCase checkAuthStateUseCase,
    required GetUsernameUseCase getUsernameUseCase,
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _checkAuthStateUseCase = checkAuthStateUseCase,
        _getUsernameUseCase = getUsernameUseCase,
        _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase {
    _initializeAuthState();
  }

  bool get isLoggedIn => _isLoggedIn;
  String? get username => _username;
  bool get isLoading => _isLoading;

  Future<void> _initializeAuthState() async {
    _isLoading = true;
    notifyListeners();

    try {
      _isLoggedIn = await _checkAuthStateUseCase.execute();
      if (_isLoggedIn) {
        _username = await _getUsernameUseCase.execute();
      }
    } catch (e) {
      // Em caso de erro, assume que não está logado
      _isLoggedIn = false;
      _username = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final success = await _loginUseCase.execute(email, password);
      if (success) {
        _isLoggedIn = true;
        _username = email.split('@').first;
      }
      return success;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _logoutUseCase.execute();
      _isLoggedIn = false;
      _username = null;
    } catch (e) {
      // Em caso de erro, força o logout local
      _isLoggedIn = false;
      _username = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
