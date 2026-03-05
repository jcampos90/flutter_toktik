import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  final List<VideoPost> videos = [];

  final VideoPostRepository videoPostRepository;

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 5));

    // final newVideos = videoPosts
    //     .map((x) => VideoModel.fromJson(x).toVideoPost())
    //     .toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}
