import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review.dart';

class ReviewProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Review>> getReviewsForRider(String riderId) async {
    try {
      final snapshot = await _firestore.collection('reviews').where('riderId', isEqualTo: riderId).get();
      List<Review> reviews = snapshot.docs.map((doc) => Review.fromDocumentSnapshot(doc)).toList();
      return reviews;
    } catch (e) {
      throw Exception('Error fetching reviews for rider: $e');
    }
  }

  Future<void> createReview(String riderId, String content, double rating) async {
    try {
      final riderRef = FirebaseFirestore.instance.collection('riders').doc(riderId);
      final reviewRef = FirebaseFirestore.instance.collection('reviews').doc();
      final review = Review(id: reviewRef.id, riderId: riderId, content: content, rating: rating, timestamp: DateTime.now(),userId: '');

      final batch = FirebaseFirestore.instance.batch();
      batch.set(reviewRef, review.toMap());
      batch.update(riderRef, {'numReviews': FieldValue.increment(1), 'totalRating': FieldValue.increment(rating)});
      await batch.commit();
    } catch (e) {
      throw Exception('Error creating review: $e');
    }
  }

// Other methods for managing reviews can be added here.
}
