import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite_offline/data/storage/local_storage.dart';

class SharedPreferencesStorage implements LocalStorage {
  Future<SharedPreferencesWithCache> getInstance() async {
    return SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  @override
  Future<void> create<T>({required String key, required T data}) async {
    final prefs = await getInstance();
    await _saveValue(prefs, key, data);
  }

  @override
  Future<void> edit<T>({required String key, required T newData}) async {
    final prefs = await getInstance();
    await _saveValue(prefs, key, newData);
  }

  @override
  Future<void> delete({required String key}) async {
    final prefs = await getInstance();
    await prefs.remove(key);
  }

  @override
  Future<T?> getData<T>({required String key}) async {
    final prefs = await getInstance();
    final value = prefs.get(key);

    if (value == null) return null;

    if (value is T) {
      return value as T;
    }

    return null;
  }

  // --- Helpers ---------------------------------------
  Future<void> _saveValue<T>(
      SharedPreferencesWithCache prefs, String key, T value) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw UnsupportedError('Tipo não suportado pelo SharedPreferences');
    }
  }
}
