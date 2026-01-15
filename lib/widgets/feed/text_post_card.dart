import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../constants/kyozo_colors.dart';
import '../../constants/kyozo_text_styles.dart';

class TextPostCard extends StatelessWidget {
  final Post post;

  const TextPostCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    final readTime = '${(post.content.text?.length ?? 0) ~/ 1000} min read';
    final date = post.createdAt?.toString().substring(0, 10) ?? '';

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFAF5FF),
            Color(0xFFFCE7F3),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: KyozoColors.readMauve,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Read',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            post.title ?? 'Untitled',
            style: KyozoTextStyles.cardTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          if (post.content.text != null)
            Text(
              post.content.text!,
              style: KyozoTextStyles.cardBody,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                readTime,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
