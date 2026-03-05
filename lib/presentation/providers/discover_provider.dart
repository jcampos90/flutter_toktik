import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  bool hasError = false;
  final List<VideoPost> videos = [];

  final VideoPostRepository videoPostRepository;

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    try {
      final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

      videos.addAll(newVideos);

      initialLoading = false;
      hasError = false;
    } catch (e) {
      initialLoading = false;
      hasError = true;
    }

    notifyListeners();
  }
}
