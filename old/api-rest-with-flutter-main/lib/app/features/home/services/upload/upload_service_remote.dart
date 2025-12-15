import 'dart:io';
import 'package:app_test_fiap/app/core/api/api_adapter.dart' as api_adapter;

import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/services/upload/upload_service.dart';
import 'package:dio/dio.dart' hide Response;

class UploadServiceRemote implements UploadService {
  final api_adapter.ApiClientAdapter client;
  UploadServiceRemote({required this.client});
  @override
  Future<({String? imageUrl, Response result})> uploadImage(
      File imageFile) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });
    final result = await client.post(path: '/api/v1/files/upload', data: form);

    final imagemUrl = result.data['location'].toString();

    return (imageUrl: imagemUrl, result: const Success());
  }
}
