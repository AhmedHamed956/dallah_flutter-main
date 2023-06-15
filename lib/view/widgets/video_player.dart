import 'package:chewie/chewie.dart';
import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  String url;

  VideoPlayerWidget({Key key, this.url}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerWidget> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    print('widget.url > ${widget.url}');
    _videoPlayerController = VideoPlayerController.network(widget.url);
    await Future.wait([_videoPlayerController.initialize()]);
    _createChewieController();
  }

  void _createChewieController() {
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,
        placeholder: Container(
          color: Colors.grey,
        ),
        autoInitialize: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Center(
        child: _chewieController != null && _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShapeLoading3(),
                  SizedBox(height: 20),
                  Text(translate('loading')),
                ],
              ),
      ),
    );
  }
}
