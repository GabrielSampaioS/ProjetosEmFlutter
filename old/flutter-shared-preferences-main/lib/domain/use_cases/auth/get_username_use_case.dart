import '../../../data/repositories/auth_repository.dart';

class GetUsernameUseCase {
  final AuthRepository _authRepository;

  GetUsernameUseCase(this._authRepository);

  Future<String?> execute() async {
    return await _authRepository.getUsername();
  }
}
