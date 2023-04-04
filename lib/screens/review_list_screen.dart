import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/rider.dart';
import '../providers/review_provider.dart';
import '../models/review.dart';

class ReviewListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Rider rider = ModalRoute.of(context)!.settings.arguments as Rider;
    return Scaffold(
      appBar: AppBar(title: Text('Reviews for ${rider.name}')),
      body: FutureBuilder<List<Review>>(
        future: Provider.of<ReviewProvider>(context, listen: false).getReviewsForRider(rider.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching reviews: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final review = snapshot.data![index];
                return ListTile(
                  title: Text(review.content),
                  subtitle: Text('${review.rating} stars'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
