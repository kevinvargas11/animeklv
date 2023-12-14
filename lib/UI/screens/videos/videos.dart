import 'package:animeklv/Data/models/models_anime_list.dart';
import 'package:animeklv/Data/models/models_anime_video.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScreenVideos extends StatelessWidget {
  final Episode episodeData;

  const ScreenVideos({Key? key, required this.episodeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Episodio'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(episodeData.id.toString()),
          ),
          FutureBuilder<VideoAnime>(
            future: Gets().getVideoAnime(episodeData.id.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('No se encontraron datos'),
                );
              } else {
                final VideoAnime getxVideoAnime = snapshot.data!;

                return VideoFormato(
                  getxVideoAnime: getxVideoAnime,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class VideoFormato extends StatefulWidget {
  final VideoAnime getxVideoAnime;

  const VideoFormato({Key? key, required this.getxVideoAnime})
      : super(key: key);

  @override
  State<VideoFormato> createState() => _VideoFormatoState();
}

class _VideoFormatoState extends State<VideoFormato> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.getxVideoAnime.stream.multi.main.url))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Your video player widget
          VideoPlayerWidget(controller: _controller),

          // Play/pause button
          FloatingActionButton(
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

          // Other widgets related to your video
          Text(widget.getxVideoAnime.info.title),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
