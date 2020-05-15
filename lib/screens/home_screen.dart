import 'package:flutter/material.dart';

import 'video_player_screen.dart';

List youtubeIds = ["ffCEr327W44", "Ry6XUsow4Vg", "caNRc1ER8p4", "HrBnEaQd4ZY"];

List backImages = [
  "assets/images/back01.png",
  "assets/images/back02.png",
  "assets/images/back03.png",
  "assets/images/back04.png",
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Player Sample"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: youtubeIds.length,
        itemBuilder: (_, index) => InkWell(
          splashColor: Colors.white30,
          onTap: () => _openVideoPlayerScreen(context, index),
          child: Image.asset(
            backImages[index],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  _openVideoPlayerScreen(BuildContext context, int index) {
    final youtubeId = youtubeIds[index];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VideoPlayerScreen(
          youtubeId: youtubeId,
        ),
      ),
    );
  }
}
