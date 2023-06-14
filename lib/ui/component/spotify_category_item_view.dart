import 'package:flutter/widgets.dart';
import 'package:praxis_flutter/design_system/spotify_color.dart';
import 'package:praxis_flutter/models/CategoryUiModel.dart';

class SpotifyCategoryItemViewComponentWidget extends StatelessWidget {
  final CategoryUiModel category;

  const SpotifyCategoryItemViewComponentWidget(
      {Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(8.0),
      color: spotifyLightGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(category.name),
          Image.network(
            category.imageUrl,
            width: 40,
            height: 40,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Text("Image failed to load");
            },
          )
        ],
      ),
    );
  }
}
