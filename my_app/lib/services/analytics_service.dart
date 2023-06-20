
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;


  // DONE
  void subscribeToActivityEvent(String activityId, String userId) async {
    await _analytics.logEvent(
        name: "subscribe_to_activity",
        parameters: {
          "activity_id": activityId,
          "user_id": userId
        });
  }

  // DONE
  void unsubscribeToActivityEvent(String activityId, String userId) async {
    await _analytics.logEvent(
        name: "unsubscribe_to_activity",
        parameters: {
          "activity_id": activityId,
          "user_id": userId
        });
  }

  // DONE
  void loginEvent(String userId) async {
    await _analytics.logEvent(
      name: 'login',
      parameters: {
        'user_id': userId,
      },
    );
  }
  // DONE
  void signupEvent(String userId) async {
    await _analytics.logEvent(
      name: 'signup',
      parameters: {
        'user_id': userId,
      },
    );
  }
  // DONE
  void uploadImage(String userId) async {
    await _analytics.logEvent(
      name: 'upload_image',
      parameters: {
        'user_id': userId,
      },
    );
  }

  void shareEvent(String? activityId) async {
    await _analytics.logEvent(
      name: 'share',
      parameters: {
        'activity_id': activityId ?? '',
      },
    );
  }

}