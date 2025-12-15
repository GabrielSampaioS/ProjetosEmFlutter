import 'package:flutter/material.dart';
import '../ui/splash/splash.dart';
import '../ui/auth/login_screen.dart';
import '../ui/home/widgets/home_screen.dart';
//import '../ui/home/widgets/run_card_widget.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String amostra = '/amostra';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen()
    //amostra: (context) => const RunCard(),
  };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text("Rota não encontrada: ${settings.name}")),
      ),
    );
  }
}
