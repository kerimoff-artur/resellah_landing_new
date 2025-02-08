import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resellah_landing_new/firebase_options.dart';
import 'package:resellah_landing_new/views/home/home_view.dart';
import 'package:resellah_landing_new/services/analytics_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await AnalyticsService.logWebsiteOpen();
  } catch (e) {
    // Handle Firebase initialization error silently
    print('Firebase initialization error: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resellah',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Roboto',
        ),
      ),
      home: const HomeView(),
    );
  }
}
