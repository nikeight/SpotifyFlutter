import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpotifySplashScreen extends StatelessWidget {
  const SpotifySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Future.delayed(const Duration(seconds: 2));
          context.go("/profile");
        },
        child: const Center(
          child: Text("This is Splash Screen"),
        ),
      );
  }
}
