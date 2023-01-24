import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  const SongCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo : Wrap the Image as per the Container Size (Radius as well)
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(0))),
      height: 200,
      width: 200,
      child: Stack(
        children: [
          const Positioned.fill(
              child: Image(
                  image: AssetImage('images/spotify_clone_card_bg_img.jpeg'))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(children: const [
              Text(
                "Song Title",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    color: Colors.black),
              ),
              Text(
                "Song Author Name",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: Colors.black45),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
