import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sqlite_offline/data/storage/local_storage.dart';

class LocalSecureStorage implements LocalStorage {
  final secureStorageInstante = const FlutterSecureStorage();

  @override
  Future<void> create<T>({required String key, required T data}) async {
    try {
      await secureStorageInstante.write(key: key, value: data.toString());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      await secureStorageInstante.delete(key: key);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> edit<T>({required String key, required T newData}) async {
    try {
      await secureStorageInstante.write(key: key, value: newData.toString());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<T?> getData<T>({required String key}) async {
    try {
      final value = await secureStorageInstante.read(key: key);
      if (value == null) return null;

      if (value is T) {
        return value as T;
      }

      return null;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
