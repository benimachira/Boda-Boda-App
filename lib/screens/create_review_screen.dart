import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/rider.dart';
import '../providers/review_provider.dart';

class CreateReviewScreen extends StatefulWidget {
  @override
  _CreateReviewScreenState createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _content = '';
  double _rating = 1.0;

  void _submit(String riderId) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await Provider.of<ReviewProvider>(context, listen: false).createReview(riderId, _content, _rating);
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error creating review: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Rider rider = ModalRoute.of(context)!.settings.arguments as Rider;
    return Scaffold(
        appBar: AppBar(title: Text('Create Review')),
        body: Form(
          key: _formKey,
          child: Column(
              children: [
          TextFormField(
          decoration: InputDecoration(labelText: 'Review content'),
          validator: (value) => value!.isEmpty ? 'Content is required' : null,
          onSaved: (value) => _content = value!,
        ),
        Slider(
          value: _rating,
          min: 1.0,
          max: 5.0,
          divisions: 4,
          onChanged: (newValue) => setState(() => _rating = newValue),
        ),
        ElevatedButton(onPressed: () => _submit(rider
            .id), child: Text('Submit Review')),
              ],
          ),
        ),
    );
  }
}