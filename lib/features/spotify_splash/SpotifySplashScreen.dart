import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';

class SpotifySplashScreen extends StatelessWidget {
  const SpotifySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: spotifyBlack,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(seconds: 1));
          context.go("/profile");
        },
        child: const Center(
          child: Image(
              height: 200,
              width: 200,
              image: AssetImage('assets/images/spotify_logo.png')),
        ),
      ),
    );
  }
}
