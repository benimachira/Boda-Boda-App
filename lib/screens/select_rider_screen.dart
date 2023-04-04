import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/rider_provider.dart';
import '../models/rider.dart';

class SelectRiderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Rider')),
      body: FutureBuilder<List<Rider>>(
        future: Provider.of<RiderProvider>(context, listen: false).getRidersNearby(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching riders: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final rider = snapshot.data![index];
                return ListTile(
                  title: Text(rider.name),
                  subtitle: Text('${rider.successfulTrips} trips | ${rider.rating} stars'),
                  leading: CircleAvatar(backgroundImage: NetworkImage(rider.imageUrl)),
                  onTap: () => Navigator.of(context).pushNamed('/riderDetails', arguments: rider),
                );
              },
            );
          }
        },
      ),
    );
  }
}
