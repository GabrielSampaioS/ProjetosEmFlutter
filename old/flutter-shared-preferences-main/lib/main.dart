import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_offline/config/app_routes.dart';

import 'config/dependencies.dart';
import 'config/theme_manager.dart';

import 'ui/auth/view_models/auth_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providersLocal,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeManager, AuthViewModel>(
      builder: (context, themeManager, authViewModel, child) {
        return MaterialApp(
          title: "BsOne",
          debugShowCheckedModeBanner: false,

          //Suporte a idiomas
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'), 
            Locale('en', 'US'), 
          ],

          //Tema
          theme: themeManager.lightTheme,
          darkTheme: themeManager.darkTheme,
          themeMode: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          //ROtas
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
