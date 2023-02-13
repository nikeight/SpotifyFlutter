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
      ..options.baseUrl = URL.iTunesTopAlbumsUrl
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

  Future<dynamic> getRequest(
    String url,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  ) async {
    try {
      // Todo : Log/Output the response with Decoded json
      final response = await dioHttpClient.get(url);
      return response.data;
    } on DioError catch (someException) {
      print(
          '[API Helper - GET] Connection Exception => ${someException.message}');
      return someException.message;
    }
  }
}
