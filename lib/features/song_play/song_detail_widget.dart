import 'package:flutter/material.dart';

class SongPlayDetailWidget extends StatelessWidget {
  const SongPlayDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Positioned.fill(
              child: Image(
                  height: 400,
                  width: 400,
                  image:
                  AssetImage('images/spotify_clone_card_bg_img.jpeg'))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: const [Text("Song Title"), Text("Song Author")],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Slider(
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: Colors.grey,
                inactiveColor: Colors.green,
                thumbColor: Colors.red,
                value: 20,
                onChanged: (newValue) {
                  // Change the value of the Seeker from here
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 32,
                  onPressed: () {},
                  icon: const Icon(Icons.shuffle)),
              IconButton(
                  iconSize: 32,
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous)),
              IconButton(
                  iconSize: 44,
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle)),
              IconButton(
                  iconSize: 32,
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next)),
              IconButton(
                  iconSize: 32,
                  onPressed: () {},
                  icon: const Icon(Icons.repeat)),
            ],
          )
        ],
      ),
    );
  }
}
