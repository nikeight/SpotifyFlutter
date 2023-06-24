import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/injection.dart';
import 'package:praxis_flutter/di/injection.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureAppInjection(String env) async {
  await configureDataInjection(env);
  GetIt.instance.$initGetIt(environment: env);
}