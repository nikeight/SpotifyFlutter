import 'package:dio/dio.dart';
import 'package:praxis_data/utils/HttpRequestType.dart';
import 'package:praxis_data/utils/access_token_helper.dart';
import 'package:praxis_data/utils/spotify_api.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sources/network/common/custom_api_client.dart';
import 'network_response_handler.dart';

Future<ApiResponse<dynamic>> safeApiCallHandler(
  CustomApiClient httpClient,
  HttpRequestType requestType,
  String url,
  SharedPreferences sharedPreference,
  dynamic requestBody,
) async {
  // Checks if the Access Token is Valid or not.
  // IF Not valid, we make another API call to update the Refresh Token.
  if (!AccessTokenHelper().isTokenValid(sharedPreference)) {
    await AccessTokenHelper().updateRefreshToken(httpClient, sharedPreference);
  }

  /// Get Request needed access_token for each Request
  switch (requestType) {
    case HttpRequestType.GET:
      final accessToken = sharedPreference.getString(SPOTIFY_ACCESS_TOKEN_KEY);
      final response =
          await httpClient.getRequest(url, null, null, accessToken);
      return networkResponseHandler(response);
    case HttpRequestType.POST:
      final response = await httpClient.postRequest(url, requestBody);
      return networkResponseHandler(response);
  }
}
