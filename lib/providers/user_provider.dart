import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> getUserById(String id) async {
    try {
      final snapshot = await _firestore.collection('users').doc(id).get();
      return User.fromDocumentSnapshot(snapshot);
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }

// Other methods for managing user data can be added here.
}
