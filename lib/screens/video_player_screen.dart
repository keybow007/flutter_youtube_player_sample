import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoPlayerScreen extends StatefulWidget {

  final String youtubeId;
  VideoPlayerScreen({this.youtubeId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _youtubeMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
        isLive: false,
      ),
    )..addListener(listener);
    _youtubeMetaData = YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    setState(() {
      _playerState = _controller.value.playerState;
      _youtubeMetaData = _controller.metadata;
    });
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //画面を強制的に横にする
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          onReady: () => _isPlayerReady = true,
        ),
      ),
    );
  }
}
