import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/post.dart';

class FeedService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Post>> getWillerFeed() {
    Query query = _firestore.collection('blogs');

    query = query
        .where('communityHandle', isEqualTo: 'willer')
        .where('visibility', isEqualTo: 'public')
        .orderBy('createdAt', descending: true);

    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    });
  }

  Stream<List<Post>> getCommunityFeed(String handle) {
    Query query = _firestore.collection('blogs');

    query = query
        .where('communityHandle', isEqualTo: handle)
        .where('visibility', isEqualTo: 'public')
        .orderBy('createdAt', descending: true);

    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    });
  }
}
