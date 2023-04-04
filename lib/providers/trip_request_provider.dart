import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/trip_request.dart';

class TripRequestProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TripRequest> createTripRequest(String userId, String riderId) async {
    try {
      final newTripRequest = {
        'userId': userId,
        'riderId': riderId,
        'status': 'pending',
        'timestamp': FieldValue.serverTimestamp(),
      };
      final docRef = await _firestore.collection('tripRequests').add(newTripRequest);
      final tripRequest = TripRequest.fromDocumentSnapshot(await docRef.get());
      return tripRequest;
    } catch (e) {
      throw Exception('Error creating trip request: $e');
    }
  }

// Other methods for managing trip requests can be added here.
}
