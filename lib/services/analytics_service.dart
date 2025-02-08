import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics? analytics = _initializeAnalytics();

  static FirebaseAnalytics? _initializeAnalytics() {
    try {
      return FirebaseAnalytics.instance;
    } catch (e) {
      print('Analytics initialization error: $e');
      return null;
    }
  }

  // Website visit
  static Future<void> logWebsiteOpen() async {
    // Temporarily disabled
  }

  // Email submission
  static Future<void> logEmailSubmission() async {
    // Temporarily disabled
  }

  // Navigation clicks
  static Future<void> logNavClick(String destination) async {
    // Temporarily disabled
  }
} 