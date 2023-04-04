import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:boda_boda_app/main.dart';

void main() {
  testWidgets('Test rider detail screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Navigate to the rider detail screen.
    await tester.tap(find.text('View Details').first);
    await tester.pumpAndSettle();

    // Verify that the rider's name is displayed.
    expect(find.text('Jane Doe'), findsOneWidget);

    // Verify that the rider's image is displayed.
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Verify that the rider's location is displayed.
    expect(find.text('Kibera'), findsOneWidget);

    // Navigate to the rider's reviews screen.
    await tester.tap(find.text('View Reviews').first);
    await tester.pumpAndSettle();

    // Verify that the first review is displayed.
    expect(find.text('Great rider!'), findsOneWidget);

    // Navigate back to the home screen.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify that the home screen is displayed.
    expect(find.text('Welcome to Boda Boda App'), findsOneWidget);
  });
}
