import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/rider.dart';

class RiderProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Rider>> getRidersNearby() async {
    try {
      final snapshot = await _firestore.collection('riders').get();
      List<Rider> riders = snapshot.docs.map((doc) => Rider.fromDocumentSnapshot(doc)).toList();
      // Add logic for filtering riders based on their location.
      return riders;
    } catch (e) {
      throw Exception('Error fetching nearby riders: $e');
    }
  }

// Other methods for managing rider data can be added here.
}
