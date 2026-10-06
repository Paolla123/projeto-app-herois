import 'package:dio/dio.dart';
import '../../../domain/exception/network_exception.dart';
import '../entity/heroi_network_entity.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient({required String baseUrl}) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: false, 
          requestHeader: false,
          responseHeader: false,
        ),
      );
  }

  Future<List<HeroiNetworkEntity>> getHerois({int? page, int? limit}) async {
    final response = await _dio.get(
      "/herois", 
      queryParameters: {
        '_page': page,
        '_per_page': limit,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkException(
        statusCode: response.statusCode!,
        message: response.statusMessage,
      );
    } else if (response.statusCode != null) {
      final HttpPagedResult receivedData = HttpPagedResult.fromJson(response.data as Map<String, dynamic>);
      return receivedData.data;
    } else {
      throw Exception('Erro desconhecido na rede');
    }
  }
}