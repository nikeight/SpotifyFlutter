import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:praxis_data/sources/network/common/custom_api_client.dart';

class MockHttpAdapter extends Mock implements HttpClientAdapter {}

class MockRequestOptions extends Mock implements RequestOptions {}

void main() {
  final Dio tdio = Dio();
  late final MockHttpAdapter mockHttpAdapter;
  late final CustomApiClient sut;

  setUpAll(() {
    registerFallbackValue(MockRequestOptions());
    mockHttpAdapter = MockHttpAdapter();
    tdio.httpClientAdapter = mockHttpAdapter;
    sut = CustomApiClient.test(tdio);
  });

  // Testing If Get method works as expected or not
  test("get success response for any given valid base url", () async {
    final responsePayLoad = jsonEncode({"response_code": "1000"});
    final httpResponse = ResponseBody.fromString(responsePayLoad, 200);

    when(() => mockHttpAdapter.fetch(any(), any(), any()))
        .thenAnswer((invocation) async => httpResponse);

    final response = await sut.getRequest("/any_given_valid_url", null, null);
    // Todo : Retry without `jsonEncode`
    /**
     * Test Fails when we remove jsonEncode
     * From the expectedOutput
     */
    final expectedOutput = jsonEncode({"response_code": "1000"});
    expect((response), equals(expectedOutput));
  });

  // test("get failure response for any given invalid base url", () async {
  //   final responsePayLoad = jsonEncode({"error": "Invalid base url"});
  //   final httpResponse = ResponseBody.fromString(responsePayLoad, 404);
  //
  //   when(() => mockHttpAdapter.fetch(any(), any(), any()))
  //       .thenAnswer((invocation) async => httpResponse);
  //
  //   final response =
  //       await sut.getRequest("/any_given_in_valid_url", null,null);
  //   final expectedOutput = {"error": "Invalid base url"};
  //   final actualResponseStatusCode = (response as Response<dynamic>).statusCode;
  //   expect(actualResponseStatusCode, 404);
  // });


  test("get error catched when there is no internet connections", () async {
    when(() => mockHttpAdapter.fetch(any(), any(), any()))
        .thenThrow(Exception("No internet connection"));

    final response =
        await sut.getRequest("/any_valid_base_url",null,null);
    const expectedOutPut = "Exception: No internet connection";
    expect(response, expectedOutPut);
  });
}
