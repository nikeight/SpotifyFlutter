import 'package:json_annotation/json_annotation.dart';

part 'spotify_access_token_request_model.g.dart';

@JsonSerializable()
class SpotifyAccessTokenRequestModel {
  @JsonKey(name: "grant_type")
  String? grantType;
  @JsonKey(name: "client_id")
  String? clientId;
  @JsonKey(name: "client_secret")
  String? clientSecret;

  SpotifyAccessTokenRequestModel({
      this.grantType, this.clientId, this.clientSecret});

  factory SpotifyAccessTokenRequestModel.fromJson(Map<String, dynamic> json) => _$SpotifyAccessTokenRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpotifyAccessTokenRequestModelToJson(this);
}
