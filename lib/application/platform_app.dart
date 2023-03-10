import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:praxis_flutter/l10n/l10n.dart';
import 'package:praxis_flutter/presentation/core/widgets/abstract_plaform_widget.dart';
import 'package:praxis_flutter/routing/routes.dart';

class SpotifyApp extends AbstractPlatformWidget<CupertinoApp, MaterialApp> {
  final String title;

  const SpotifyApp({Key? key, this.title = 'Spotify'}) : super(key: key);

  @override
  CupertinoApp buildCupertino(BuildContext context) {
    return CupertinoApp.router(
      routeInformationProvider: praxisRoutes.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: title,
      theme: const CupertinoThemeData(),
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  @override
  MaterialApp buildMaterial(BuildContext context) {
    var lightTheme = FlexColorScheme.light(scheme: FlexScheme.blueWhale).toTheme;
    var darkTheme = FlexColorScheme.dark(scheme: FlexScheme.blueWhale).toTheme;
    return MaterialApp.router(
      routeInformationProvider: praxisRoutes.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: title,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: praxisRoutes.routeInformationParser,
      routerDelegate: praxisRoutes.routerDelegate,
    );
  }
}
