abstract class LocalStorage {
  Future<void> create<T>({required String key, required T data});
  Future<T?> getData<T>({required String key});
  Future<void> delete({required String key});
  Future<void> edit<T>({required String key, required T newData});
}
