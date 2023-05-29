import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule{
  // Provide HttpClient
  Dio dioHttpInstance() => Dio();
}

@module
abstract class StorageModule{

  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();
}