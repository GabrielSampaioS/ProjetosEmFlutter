abstract class ApiClientAdapter<T> {
  Future<Response> post({required String path, Object? data});
  Future<Response> get({required String path, Map<String, String>? queryParam});
  Future<Response> delete({required String path});
  Future<Response> put({required String path, Object? data});
}

class Response<T> {
  T? data;
  int? statusCode;

  Response({this.data, this.statusCode});
}
