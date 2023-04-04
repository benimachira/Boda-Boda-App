import 'package:cloud_firestore/cloud_firestore.dart';

class Rider {
  final String id;
  final String name;
  final String imageUrl;
  final int successfulTrips;
  final double rating;

  Rider({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.successfulTrips,
    required this.rating,
  });

  factory Rider.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Rider(
      id: doc.id,
      name: doc['name'],
      imageUrl: doc['imageUrl'],
      successfulTrips: doc['successfulTrips'],
      rating: doc['rating'].toDouble(),
    );
  }
}
