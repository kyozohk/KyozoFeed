import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../models/post.dart';
import '../../services/feed_service.dart';
import '../../constants/kyozo_colors.dart';
import '../../widgets/feed/text_post_card.dart';
import '../../widgets/feed/audio_post_card.dart';
import '../../widgets/feed/video_post_card.dart';
import '../../widgets/feed/image_post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedService _feedService = FeedService();
  String _filter = 'all';

  List<Post> _filterPosts(List<Post> posts) {
    switch (_filter) {
      case 'read':
        return posts
            .where((p) => p.type == PostType.text || p.type == PostType.image)
            .toList();
      case 'listen':
        return posts.where((p) => p.type == PostType.audio).toList();
      case 'watch':
        return posts.where((p) => p.type == PostType.video).toList();
      default:
        return posts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KyozoColors.overlayGray.withOpacity(0.7),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: StreamBuilder<List<Post>>(
              stream: _feedService.getWillerFeed(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: KyozoColors.primaryPurple,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading feed',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${snapshot.error}',
                          style: const TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                final posts = _filterPosts(snapshot.data ?? []);

                if (posts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No posts yet',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Be the first to create content!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return _buildMasonryGrid(posts);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.08),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFilterButton('All', 'all', Colors.grey[700]!),
          const SizedBox(width: 8),
          _buildFilterButton('Read', 'read', KyozoColors.readMauve),
          const SizedBox(width: 8),
          _buildFilterButton('Listen', 'listen', KyozoColors.listenBlue),
          const SizedBox(width: 8),
          _buildFilterButton('Watch', 'watch', KyozoColors.watchYellow),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, String value, Color activeColor) {
    final isActive = _filter == value;
    return GestureDetector(
      onTap: () => setState(() => _filter = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 4)
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildMasonryGrid(List<Post> posts) {
    final audioPosts = posts.where((p) => p.type == PostType.audio).toList();
    final otherPosts = posts.where((p) => p.type != PostType.audio).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          if (audioPosts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: AudioPostCard(
                post: audioPosts.first,
                isHorizontal: true,
              ),
            ),
          if (otherPosts.isNotEmpty)
            MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherPosts.length,
              itemBuilder: (context, index) {
                return _buildPostCard(otherPosts[index]);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    switch (post.type) {
      case PostType.audio:
        return AudioPostCard(post: post);
      case PostType.video:
        return VideoPostCard(post: post);
      case PostType.image:
        return ImagePostCard(post: post);
      case PostType.text:
      default:
        return TextPostCard(post: post);
    }
  }
}
