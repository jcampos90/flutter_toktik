import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/widgets/discover/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    if (discoverProvider.initialLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(body: VideoScrollableView(videos: discoverProvider.videos));
  }
}
