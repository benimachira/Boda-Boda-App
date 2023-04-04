import 'package:cloud_firestore/cloud_firestore.dart';

class TripRequest {
  final String id;
  final String userId;
  final String riderId;
  final String status;
  final DateTime timestamp;

  TripRequest({
    required this.id,
    required this.userId,
    required this.riderId,
    required this.status,
    required this.timestamp,
  });

  factory TripRequest.fromDocumentSnapshot(DocumentSnapshot doc) {
    return TripRequest(
      id: doc.id,
      userId: doc['userId'],
      riderId: doc['riderId'],
      status: doc['status'],
      timestamp: (doc['timestamp'] as Timestamp).toDate(),
    );
  }
}
