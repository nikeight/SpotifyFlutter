import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/sources/network/common/url.dart';

@injectable
class CustomApiClient {
  final Dio dioHttpClient;

  // Named Constructor in Dart
  // Used for Testing
  CustomApiClient.test(this.dioHttpClient);

  CustomApiClient(this.dioHttpClient) {
    dioHttpClient
      ..options.connectTimeout = ApiClientConstants.apiTimeOut
      ..options.receiveTimeout = ApiClientConstants.apiReceiveTimeOut
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  Future<Response<dynamic>?> getRequest(
    String url,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    String? accessToken,
  ) async {
    try {
      dioHttpClient.options.headers['Authorization'] = 'Bearer $accessToken';
      final response =
          await dioHttpClient.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (someException) {
      print(
          '[API Helper - GET] Connection Exception => ${someException.message}');
      return null;
    }
  }

  Future<Response<dynamic>?> postRequest(String url, dynamic body) async {
    try {
      dioHttpClient.options.headers['Content-Type'] =
          'application/x-www-form-urlencoded';
      final postResponse = await dioHttpClient.post(url, data: body);
      print("Status Code -> ${postResponse.statusCode}");
      return postResponse;
    } on DioError catch (exception) {
      print('[API Helper - POST] Connection Exception => ${exception.message}');
      return null;
    }
  }
}
