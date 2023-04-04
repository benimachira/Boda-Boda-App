import 'package:flutter/material.dart';
import '../models/rider.dart';

class RiderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Rider rider = ModalRoute.of(context)!.settings.arguments as Rider;
    return Scaffold(
        appBar: AppBar(title: Text('${rider.name}')),
        body: Column(
            children: [
        CircleAvatar(backgroundImage: NetworkImage(rider.imageUrl), radius: 50),

              Text(rider.name, style: TextStyle(fontSize: 24)),
              Text('${rider.successfulTrips} trips | ${rider.rating} stars'),
              // Display additional rider information, such as reviews, here.
              ElevatedButton(
                onPressed: () {
                  // Implement logic for requesting a trip with this rider.
                },
                child: Text('Request Trip'),
              ),
            ],
        ),
    );
  }
}
