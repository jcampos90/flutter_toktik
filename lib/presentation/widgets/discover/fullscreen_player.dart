import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/discover/gradient_video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  const FullscreenPlayer({
    Key? key,
    required this.videoUrl,
    required this.videoCaption,
  }) : super(key: key);

  final String videoUrl;
  final String videoCaption;

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;

  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 4));
    }

    return GestureDetector(
      onTap: () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      },
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          children: [
            // Video Player
            VideoPlayer(controller),

            // Gradient Background
            GradientVideoBackground(),

            Positioned(
              bottom: 50,
              left: 20,
              child: _VideoCaption(widget.videoCaption),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoCaption extends StatelessWidget {
  const _VideoCaption(this.caption, {Key? key}) : super(key: key);

  final String caption;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: screenSize.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
