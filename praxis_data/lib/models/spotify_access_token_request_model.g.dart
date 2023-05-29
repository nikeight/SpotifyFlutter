// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_access_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyAccessTokenRequestModel _$SpotifyAccessTokenRequestModelFromJson(
        Map<String, dynamic> json) =>
    SpotifyAccessTokenRequestModel(
      grantType: json['grant_type'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$SpotifyAccessTokenRequestModelToJson(
        SpotifyAccessTokenRequestModel instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
