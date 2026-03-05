import 'package:tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infrastructure/models/video_model.dart';
import 'package:tok_tik/shared/data/videos_db.dart';

class VideoPostDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByPage(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(Duration(seconds: 2));

    final List<VideoPost> videos = videoPosts
        .map((v) => VideoModel.fromJson(v).toVideoPost())
        .toList();

    return videos;
  }
}
