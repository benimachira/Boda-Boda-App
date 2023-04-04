import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String userId;
  final String riderId;
  final String content;
  final double rating;
  final DateTime timestamp;

  Review({
    required this.id,
    required this.userId,
    required this.riderId,
    required this.content,
    required this.rating,
    required this.timestamp,
  });

  factory Review.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Review(
      id: doc.id,
      userId: doc['userId'],
      riderId: doc['riderId'],
      content: doc['content'],
      rating: doc['rating'].toDouble(),
      timestamp: (doc['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'riderId': riderId,
      'content': content,
      'rating': rating,
      'createdAt': timestamp ?? DateTime.now(),
    };
  }
}
