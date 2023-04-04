import 'package:boda_boda_app/screens/review_list_screen.dart';
import 'package:boda_boda_app/screens/rider_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/splash_screen.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './providers/auth_provider.dart';
import './providers/user_provider.dart';
import './providers/rider_provider.dart';
import './providers/trip_request_provider.dart';
import './providers/review_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => UserProvider()),
        ChangeNotifierProvider(create: (ctx) => RiderProvider()),
        ChangeNotifierProvider(create: (ctx) => TripRequestProvider()),
        ChangeNotifierProvider(create: (ctx) => ReviewProvider()),
      ],
      child: MaterialApp(
        title: 'Boda Boda App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => SplashScreen(),
          '/login': (ctx) => LoginScreen(),
          '/home': (ctx) => HomeScreen(),
          '/rider-detail': (ctx) => RiderDetailsScreen(),
          '/rider-reviews': (ctx) => ReviewListScreen(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (ctx) => LoginScreen());
            case '/home':
              return MaterialPageRoute(builder: (ctx) => HomeScreen());
            case '/rider-detail':
              final riderId = settings.arguments as String;
              return MaterialPageRoute(builder: (ctx) => RiderDetailsScreen());
            case '/rider-reviews':
              final riderId = settings.arguments as String;
              return MaterialPageRoute(builder: (ctx) => ReviewListScreen());
            default:
              return null;
          }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => SplashScreen());
        },
      ),
    );
  }
}
