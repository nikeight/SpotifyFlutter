import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';

class SpotifyButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const SpotifyButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: SpotifyText.headline(title),
    );
  }
}
