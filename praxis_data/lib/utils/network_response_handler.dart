import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:praxis_flutter_domain/utils/api_response.dart';
import 'package:praxis_flutter_domain/utils/validations.dart';

/// A Network Response Handler Class
/// Handles and return data based on the Status Code of the Response
/// Common for each API Call used along with SafeApiCallHandler,

/// Todo : Add more Edge cases

Future<ApiResponse<dynamic>> networkResponseHandler(
    Response<dynamic>? response) async {
  try {
    final responseStatusCode = response?.statusCode ?? 404;

    if (responseStatusCode >= 200 && responseStatusCode <= 299) {
      // Returning the Raw data.
      return Success(data: response?.data);
    } else if (responseStatusCode >= 400 && responseStatusCode <= 499) {
      return Failure(
          error:
              Exception("Unauthorized Error, Status Code $responseStatusCode"));
    } else {
      return Failure(error: Exception("Something went wrong"));
    }
  } on RedirectException catch (redirectException) {
    return Failure(
        error: Exception("Redirection Exception $redirectException"));
  } on InvalidRequestException catch (clientRequestException) {
    return Failure(
        error: Exception("Redirection Exception $clientRequestException"));
  } on TimeoutException catch (timeOutException) {
    return Failure(error: Exception("Redirection Exception $timeOutException"));
  } on UnrecognizedKeysException catch (unrecognizedKeysException) {
    return Failure(
        error: Exception("Redirection Exception $unrecognizedKeysException"));
  } on IOException catch (ioException) {
    return Failure(error: Exception("Exception caught $ioException"));
  } on Exception catch (someException) {
    return Failure(error: Exception("Exception caught $someException"));
  }
}
