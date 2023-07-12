import 'package:flutter/material.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';

class SpotifyChipButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function()? onChipClicked;

  const SpotifyChipButton(
      {Key? key,
      required this.label,
      required this.isSelected,
      required this.onChipClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onChipClicked,
        child: Chip(
          avatar: CircleAvatar(
            backgroundColor: isSelected ? primaryGreenColor : spotifyLightGrey,
            radius: 16,
          ),
          label: Text(label),
        ),
      ),
    );
  }
}
