import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/design_system/spotify_text.dart';
import 'package:praxis_flutter/models/CategoryUiModel.dart';
import 'package:praxis_flutter/routing/routes.dart';

class SpotifyCategoryItemViewComponentWidget extends StatelessWidget {
  final CategoryUiModel category;

  const SpotifyCategoryItemViewComponentWidget(
      {Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height;
    final itemWidth = MediaQuery.of(context).size.width;
    final listOfColors = [
      Colors.red,
      Colors.purple,
      Colors.green,
      Colors.brown,
      Colors.teal,
      Colors.cyan
    ];

    // TODO : Make the Whole Card, Clickable and Image get Cut at Edges
    return Container(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(searchScreenRouteName);
        },
        child: Card(
          color: listOfColors[Random().nextInt(listOfColors.length)],
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SpotifyText.bodyText(category.name),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(35 / 360),
                  child: Image.network(
                    category.imageUrl,
                    width: 60,
                    height: 60,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Text("Image failed to load");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
