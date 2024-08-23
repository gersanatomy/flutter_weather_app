import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/apis/api_exception.dart';

class ApiRequest {
  final String baseUrl = 'https://api.open-meteo.com';
  final dio = Dio();

  Future<dynamic> get(String endpoint, Map<String, String> query) async {
    String url = '$baseUrl$endpoint';
    Response? response;

    try {
      response = await dio.get(
        url,
        queryParameters: query,
      );
    } on SocketException {
      rethrow;
    } catch (err) {
      print('GET Server Error');

      throw ApiException(
          statusCode: response?.statusCode ?? 000,
          message: response?.statusMessage ?? 'No Message Available');
    } finally {
      dio.close();
    }

    return response;
  }
}
