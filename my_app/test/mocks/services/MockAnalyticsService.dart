import 'package:my_app/services/analytics_service.dart';

class MockAnalyticsService extends AnalyticsService {
  @override
  void subscribeToActivityEvent(String activityId, String userId) async {}

  @override
  void unsubscribeToActivityEvent(String activityId, String userId) async {}

  @override
  void loginEvent(String userId) async {}

  @override
  void signupEvent(String userId) async {}

  @override
  void uploadImage(String userId) async {}

  @override
  void shareEvent(String? activityId) async {}
}
