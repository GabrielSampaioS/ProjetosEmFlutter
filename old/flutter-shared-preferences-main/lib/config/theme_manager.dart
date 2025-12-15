import 'package:flutter/material.dart';
import 'package:sqlite_offline/data/storage/local_storage.dart';

class ThemeManager extends ChangeNotifier {
  final String isDarkModeStorageKey = 'theme_is_dark';

  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  final LocalStorage localStorage;

  ThemeManager({required this.localStorage}) {
    init();
  }

  Future<void> init() async {
    final result = await localStorage.getData<bool>(key: isDarkModeStorageKey);
    _isDarkMode = result ?? true;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await localStorage.edit(
      key: isDarkModeStorageKey,
      newData: _isDarkMode,
    );
    notifyListeners();
  }

  Future<void> setTheme(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    await localStorage.edit(
      key: isDarkModeStorageKey,
      newData: isDarkMode,
    );
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'prompt',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,

        primary: Color(0xFF032B3A), // azul principal
        onPrimary: Colors.white, // textos/icons sobre o azul

        secondary: Color(0xFF032B3A),
        onSecondary: Colors.white,

        surface: Color.fromARGB(255, 184, 184, 184),

        onSurface: Colors.black,

        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFDFDFDF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Color(0xFF0A8EC7)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      useMaterial3: true,
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'prompt',
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,

        primary: Color.fromARGB(255, 255, 255, 255), // fundo do appbar
        onPrimary: Color.fromARGB(255, 0, 0, 0), // ícones/texto no appbar

        secondary: Color.fromARGB(255, 0, 0, 0),
        onSecondary: Color(0xFFFFFFFF),

        error: Colors.red,
        onError: Colors.white,

        surface: Color(0xFF032B3A),
        onSurface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Color(0xFF0A8EC7)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A8EC7),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
