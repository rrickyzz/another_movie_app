import 'package:another_movie_app/components/player/playbtn_portait.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VidPlayerScreen extends StatefulWidget {
  final String url;
  const VidPlayerScreen({super.key, required this.url});

  @override
  VideoAppState createState() => VideoAppState();
}

class VideoAppState extends State<VidPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    Center(
                      child: PlayButton(isPlaying: _controller.value.isPlaying),
                    )
                  ],
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
