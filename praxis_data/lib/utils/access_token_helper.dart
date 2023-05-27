import 'package:praxis_data/models/spotify_access_token_request_model.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_data/utils/api_key.dart';
import 'package:praxis_data/utils/spotify_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/spotify_data_model/access_token/SpotifyAccessTokenResponse.dart';

class AccessTokenHelper {

  // Method to check if Token is Valid or not.
  bool isTokenValid(SharedPreferences sharedPreferences) {
    final lastUpdatedTime =
        sharedPreferences.getInt(LAST_SAVED_TIME_IN_MS_KEY) ?? 0;
    return lastUpdatedTime > DateTime.now().microsecondsSinceEpoch;
  }

  Future<void> updateRefreshToken(
    CustomApiClient httpClient,
    SharedPreferences sharedPreferences,
  ) async {

    final requestBody = SpotifyAccessTokenRequestModel(
      grantType: grant_type,
      clientId: client_id,
      clientSecret: client_secret,
    );

    final accessTokenResponse = await httpClient.postRequest(
        SPOTIFY_ACCESS_TOKEN_ENDPOINT,
        requestBody.toJson()
    );

    if (accessTokenResponse?.statusCode == 200) {
        final accessTokenResponseModel = SpotifyAccessTokenDataModel.fromJson(
            accessTokenResponse?.data);

        final accessToken =
            accessTokenResponseModel.accessToken ?? "empty_access_token";

        // Saving the time Token received and added 3500 millisecond buffer
        // as per the Spotify Docs.

        await sharedPreferences.setInt(LAST_SAVED_TIME_IN_MS_KEY,
            DateTime.now().microsecondsSinceEpoch + 3500);

        // Saving the new access token
        await sharedPreferences.setString(
            SPOTIFY_ACCESS_TOKEN_KEY, accessToken);
    }
  }
}
