import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../constants/kyozo_colors.dart';
import '../../constants/kyozo_text_styles.dart';

class AudioPostCard extends StatelessWidget {
  final Post post;
  final bool isHorizontal;

  const AudioPostCard({
    required this.post,
    this.isHorizontal = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: KyozoColors.listenBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Listen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            post.title ?? 'Untitled Audio',
            style: KyozoTextStyles.cardTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(60, (index) {
              final height = 20.0 + (index % 5) * 12.0;
              return Container(
                width: 2,
                height: height,
                decoration: BoxDecoration(
                  color: const Color(0xFFDBEAFE),
                  borderRadius: BorderRadius.circular(1),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: KyozoColors.listenBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '0:00',
                style: TextStyle(
                  fontSize: 14,
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
