import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqlite_offline/data/storage/local_secure_storage.dart';
import 'package:sqlite_offline/data/storage/local_storage.dart';
import 'package:sqlite_offline/data/storage/shared_prederences_Storage.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/use_cases/auth/check_auth_state_use_case.dart';
import '../domain/use_cases/auth/get_username_use_case.dart';
import '../domain/use_cases/auth/login_use_case.dart';
import '../domain/use_cases/auth/logout_use_case.dart';
import '../ui/auth/view_models/auth_view_model.dart';
import 'theme_manager.dart';

List<SingleChildWidget> get providersLocal {
  return [
    Provider<LocalStorage>(
      create: (context) => SharedPreferencesStorage(),
    ),

    ChangeNotifierProvider<ThemeManager>(
      create: (context) => ThemeManager(
        localStorage: context.read<LocalStorage>(),
      ),
    ),
    Provider<AuthRepository>(
      create: (context) => MockAuthRepository(
        localStorage: LocalSecureStorage(),
      ),
    ),

    Provider<CheckAuthStateUseCase>(
      lazy: true,
      create: (context) => CheckAuthStateUseCase(context.read()),
    ),
    Provider<GetUsernameUseCase>(
      lazy: true,
      create: (context) => GetUsernameUseCase(context.read()),
    ),
    Provider<LoginUseCase>(
      lazy: true,
      create: (context) => LoginUseCase(context.read()),
    ),
    Provider<LogoutUseCase>(
      lazy: true,
      create: (context) => LogoutUseCase(context.read()),
    ),
    // View Models

    ChangeNotifierProvider(
      lazy: true,
      create: (context) => AuthViewModel(
        checkAuthStateUseCase: context.read(),
        getUsernameUseCase: context.read(),
        loginUseCase: context.read(),
        logoutUseCase: context.read(),
      ),
    )
  ];
}
