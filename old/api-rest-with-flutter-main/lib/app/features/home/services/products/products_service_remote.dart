import 'package:app_test_fiap/app/core/api/api_adapter.dart' as api_adapter;
import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';

class ProductsServiceRemote implements ProductsService {
  static const _basePath = '/api/v1/products';
  final api_adapter.ApiClientAdapter client;

  ProductsServiceRemote({required this.client});

  // --- Helpers --- //

  Response _mapDioExceptionToResponse(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const ConnectionFailure(message: 'Tempo de conexão esgotado');
    }

    if (e.type == DioExceptionType.connectionError) {
      return const ConnectionFailure(message: 'Falha na conexão');
    }

    final serverMessage = e.response?.data is Map
        ? (e.response?.data as Map)['message']?.toString()
        : e.response?.data?.toString();

    return GeneralFailure(
      message: serverMessage ?? 'Erro desconhecido do servidor',
    );
  }

  ProductModel? _tryParseProduct(dynamic data) {
    try {
      if (data == null) return null;
      if (data is Map<String, dynamic>) {
        return ProductModel.fromJson2(data);
      }
      if (data is Map && data['data'] is Map<String, dynamic>) {
        return ProductModel.fromJson2(data['data'] as Map<String, dynamic>);
      }
    } catch (_) {
      // parse error -> return null
    }
    return null;
  }

  List<ProductModel> _tryParseProductList(dynamic data) {
    try {
      if (data is List) {
        return data
            .whereType<Map<String, dynamic>>()
            .map((e) => ProductModel.fromJson2(e))
            .toList();
      }

      if (data is Map && data['products'] is List) {
        return (data['products'] as List)
            .whereType<Map<String, dynamic>>()
            .map((e) => ProductModel.fromJson2(e))
            .toList();
      }
    } catch (_) {
      // parse error -> return empty list
    }
    return <ProductModel>[];
  }

  // --- API methods --- //

  @override
  Future<({List<ProductModel> products, Response result})> getProducts() async {
    try {
      final api_adapter.Response response = await client.get(path: _basePath);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final products = _tryParseProductList(response.data);
        return (products: products, result: const Success());
      }

      return (
        products: <ProductModel>[],
        result: GeneralFailure(
            message:
                'Resposta inesperada do servidor: código ${response.statusCode}')
      );
    } on DioException catch (e) {
      return (
        products: <ProductModel>[],
        result: _mapDioExceptionToResponse(e)
      );
    } catch (e) {
      return (
        products: <ProductModel>[],
        result: GeneralFailure(message: 'Erro inesperado: $e')
      );
    }
  }

  @override
  Future<({ProductModel? product, Response result})> createProduct(
      ProductModel product) async {
    try {
      final api_adapter.Response response = await client.post(
        path: _basePath,
        data: product.toCreateJson(),
      );

      switch (response.statusCode) {
        case 201:
          final created = _tryParseProduct(response.data) ?? product;
          return (product: created, result: const Success());
        case 400:
          return (
            product: null,
            result: const GeneralFailure(message: 'Produto já cadastrado')
          );
        default:
          return (
            product: null,
            result: GeneralFailure(
                message:
                    'Erro inesperado do servidor: código ${response.statusCode}')
          );
      }
    } on DioException catch (e) {
      return (product: null, result: _mapDioExceptionToResponse(e));
    } catch (e) {
      return (
        product: null,
        result: GeneralFailure(message: 'Erro inesperado: $e')
      );
    }
  }

  @override
  Future<({ProductModel? product, Response result})> updateProduct(
      int id, ProductModel product) async {
    try {
      final api_adapter.Response response = await client.put(
        path: '$_basePath/$id',
        data: product.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final updated = _tryParseProduct(response.data) ?? product;
        return (product: updated, result: const Success());
      }

      return (
        product: null,
        result: GeneralFailure(
            message: 'Erro ao atualizar produto: código ${response.statusCode}')
      );
    } on DioException catch (e) {
      return (product: null, result: _mapDioExceptionToResponse(e));
    } catch (e) {
      return (
        product: null,
        result: GeneralFailure(message: 'Erro inesperado: $e')
      );
    }
  }

  @override
  Future<({Response result, bool success})> deleteProduct(int id) async {
    try {
      final api_adapter.Response response =
          await client.delete(path: '$_basePath/$id');

      switch (response.statusCode) {
        case 200:
        case 201:
        case 204:
          return (result: const Success(), success: true);
        default:
          return (
            result: GeneralFailure(
                message:
                    'Não foi possível remover o produto: código ${response.statusCode}'),
            success: false
          );
      }
    } on DioException catch (e) {
      return (result: _mapDioExceptionToResponse(e), success: false);
    } catch (e) {
      return (
        result: GeneralFailure(message: 'Erro inesperado: $e'),
        success: false
      );
    }
  }

  @override
  Future<({Response result, ProductModel? product})> getProduct(int id) async {
    try {
      final api_adapter.Response response =
          await client.get(path: '$_basePath/$id');

      if (response.statusCode == 200) {
        final product = _tryParseProduct(response.data);
        if (product != null) {
          return (result: const Success(), product: product);
        }
        return (
          result: const GeneralFailure(message: 'Formato de produto inválido'),
          product: null
        );
      }

      return (
        result: GeneralFailure(
            message: 'Erro ao obter produto: código ${response.statusCode}'),
        product: null
      );
    } on DioException catch (e) {
      return (result: _mapDioExceptionToResponse(e), product: null);
    } catch (e) {
      return (
        result: GeneralFailure(message: 'Erro inesperado: $e'),
        product: null
      );
    }
  }
}
