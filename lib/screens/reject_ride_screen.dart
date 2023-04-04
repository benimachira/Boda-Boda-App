import 'package:flutter/material.dart';
import '../models/rider.dart';

class RejectRideScreen extends StatelessWidget {
  final Rider rider;

  RejectRideScreen({required this.rider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ride Rejected')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your ride request with ${rider.name} has been rejected.'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/selectRider'),
              child: Text('Find another rider'),
            ),
          ],
        ),
      ),
    );
  }
}
