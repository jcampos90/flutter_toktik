import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infrastructure/models/video_model.dart';
import 'package:tok_tik/shared/data/videos_db.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  final List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 5));

    final newVideos = videoPosts
        .map((x) => VideoModel.fromJson(x).toVideoPost())
        .toList();

    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}
