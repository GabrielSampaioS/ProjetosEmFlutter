import '../../../data/repositories/auth_repository.dart';

class CheckAuthStateUseCase {
  final AuthRepository _authRepository;

  CheckAuthStateUseCase(this._authRepository);

  Future<bool> execute() async {
    return await _authRepository.isLoggedIn();
  }
}
