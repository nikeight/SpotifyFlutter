import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule{
  // Provide HttpClient
  Dio dioHttpInstance() => Dio();
}
