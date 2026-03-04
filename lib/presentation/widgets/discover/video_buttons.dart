import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/formatter.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          icon: Icons.favorite,
          color: Colors.red,
        ),
        SizedBox(height: 20),
        _CustomIconButton(
          value: video.likes,
          icon: Icons.remove_red_eye,
          color: Colors.white,
        ),
        SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: Duration(seconds: 5),
          child: _CustomIconButton(
            value: 0,
            icon: Icons.play_circle_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    Key? key,
    this.value = 0,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final int value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon, size: 30), color: color),
        if (value > 0) Text(Formatter.readableNumber(value.toDouble())),
      ],
    );
  }
}
