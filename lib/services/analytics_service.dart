import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // Website visit
  static Future<void> logWebsiteOpen() async {
    await analytics.logEvent(
      name: 'website_open',
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  // Email submission
  static Future<void> logEmailSubmission() async {
    await analytics.logEvent(
      name: 'email_submit',
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  // Navigation clicks
  static Future<void> logNavClick(String destination) async {
    await analytics.logEvent(
      name: 'nav_click',
      parameters: {
        'destination': destination,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
} 