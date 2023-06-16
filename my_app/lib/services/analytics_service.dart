
import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  void openActivityEvent(String activityId) async {
    await _analytics.logEvent(
        name: "open_activity",
        parameters: {
          "activity_id": activityId,
        });
  }

  void subscribeToActivityEvent(String activityId, String userId) async {
    await _analytics.logEvent(
        name: "subscribe_to_activity",
        parameters: {
          "activity_id": activityId,
          "user_id": userId
        });
  }

  void unsubscribeToActivityEvent(String activityId, String userId) async {
    await _analytics.logEvent(
        name: "unsubscribe_to_activity",
        parameters: {
          "activity_id": activityId,
          "user_id": userId
        });
  }
}