import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:praxis_flutter/bloc/app_bloc_observer.dart';
import 'package:praxis_flutter/di/service_locator.dart';
import 'package:praxis_flutter/firebase_options.dart';
import 'package:praxis_flutter/infrastructure/notifications/firebase_messaging.dart';
import 'package:praxis_flutter/di/injection.dart';

import 'services/MyAudioHandler.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  flutterLogError();

  WidgetsFlutterBinding.ensureInitialized();

  // GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  HttpOverrides.global = MyHttpOverrides();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupServiceLocator();

  await initAudioService();

  await configureAppInjection(env);

  await runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();
      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );

  GetIt.instance.get<PraxisFirebaseMessaging>().setupMessaging();
}

void flutterLogError() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Logger.root.level = Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: '0306',
      androidNotificationChannelName: 'Spotify',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}
