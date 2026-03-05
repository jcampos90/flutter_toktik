import 'package:tok_tik/domain/entities/video_post.dart' show VideoPost;

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByPage(String userId);
}
