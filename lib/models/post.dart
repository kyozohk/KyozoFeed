import 'package:cloud_firestore/cloud_firestore.dart';

enum PostType { text, image, audio, video, poll }
enum PostVisibility { public, private, membersOnly }

class Post {
  final String id;
  final String postId;
  final String? title;
  final PostType type;
  final PostContent content;
  final String authorId;
  final String communityHandle;
  final String? communityId;
  final int likes;
  final int comments;
  final DateTime? createdAt;
  final PostVisibility visibility;

  Post({
    required this.id,
    required this.postId,
    this.title,
    required this.type,
    required this.content,
    required this.authorId,
    required this.communityHandle,
    this.communityId,
    required this.likes,
    required this.comments,
    this.createdAt,
    required this.visibility,
  });

  factory Post.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      postId: data['postId'] ?? doc.id,
      title: data['title'],
      type: _parsePostType(data['type']),
      content: PostContent.fromMap(data['content'] ?? {}),
      authorId: data['authorId'] ?? '',
      communityHandle: data['communityHandle'] ?? '',
      communityId: data['communityId'],
      likes: data['likes'] ?? 0,
      comments: data['comments'] ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      visibility: _parseVisibility(data['visibility']),
    );
  }

  static PostType _parsePostType(String? type) {
    switch (type) {
      case 'text':
        return PostType.text;
      case 'image':
        return PostType.image;
      case 'audio':
        return PostType.audio;
      case 'video':
        return PostType.video;
      case 'poll':
        return PostType.poll;
      default:
        return PostType.text;
    }
  }

  static PostVisibility _parseVisibility(String? visibility) {
    switch (visibility) {
      case 'public':
        return PostVisibility.public;
      case 'private':
        return PostVisibility.private;
      case 'members-only':
        return PostVisibility.membersOnly;
      default:
        return PostVisibility.public;
    }
  }
}

class PostContent {
  final String? text;
  final List<String>? mediaUrls;
  final String? thumbnailUrl;
  final String? fileType;

  PostContent({
    this.text,
    this.mediaUrls,
    this.thumbnailUrl,
    this.fileType,
  });

  factory PostContent.fromMap(Map<String, dynamic> map) {
    return PostContent(
      text: map['text'],
      mediaUrls: (map['mediaUrls'] as List?)?.cast<String>(),
      thumbnailUrl: map['thumbnailUrl'],
      fileType: map['fileType'],
    );
  }
}
