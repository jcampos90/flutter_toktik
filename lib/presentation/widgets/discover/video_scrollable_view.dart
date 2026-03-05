import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/discover/fullscreen_player.dart';
import 'package:tok_tik/presentation/widgets/discover/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({Key? key, required this.videos}) : super(key: key);

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: video.videoUrl,
                videoCaption: video.caption,
              ),
            ),
            Positioned(bottom: 0, right: 0, child: VideoButtons(video: video)),
          ],
        );
      },
    );
  }
}
