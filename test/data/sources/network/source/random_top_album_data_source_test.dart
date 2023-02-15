import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_data/models/album/model/dt_song.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';
import 'package:praxis_data/sources/network/source/RandomTopAlbumDataSource.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';

class MockCustomApiClient extends Mock implements CustomApiClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  List<DtSong> fakeListDtSong = List.generate(
    5,
    (index) => DtSong(1 + index, "Discovery", "Daft Punk",
        "https://daftpunk/discovery.png", false),
  );

  late final RandomTopAlbumDataSource dataSource;
  late final MockCustomApiClient mockCustomApiClient;

  setUpAll(() {
    mockCustomApiClient = MockCustomApiClient();
    dataSource = RandomTopAlbumDataSource(mockCustomApiClient);
  });

  test("return success state for success API call", () async {
    final String stringResponseFromRawJson = await rootBundle.loadString(
        '/Users/niketjain/FlutterProjects/SpotifyFlutter/assets/raw_json/itunes_100_item_response.json');
    when(() => mockCustomApiClient.getRequest(any(), null, null))
        .thenAnswer((invocation) async => stringResponseFromRawJson);
    final actualResponse = await dataSource.getTopRandomAlbums();
    if (fakeListDtSong.isNotEmpty) {
      expect(actualResponse, isA<Success>());
    }
  });

  test("return exception state for a failure API call", () async {
    when(() => mockCustomApiClient.getRequest(any(), null, null))
        .thenThrow(Exception("Connection time out error"));
    final actualResponse = await dataSource.getTopRandomAlbums();
    expect(actualResponse, isA<Failure>());
  });
}
