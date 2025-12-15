import '../../../data/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<bool> execute(String email, String password) async {
    return await _authRepository.login(email, password);
  }
}
