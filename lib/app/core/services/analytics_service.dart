import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsService {
  static FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver firebaseAnalyticsObserver =
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics);

  String get _platform {
    return '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';
  }

  void _log(String message) {
    print('[Analytics][$_platform] -> $message');
  }

  FirebaseAnalytics get instance {
    return firebaseAnalytics;
  }

  FirebaseAnalyticsObserver get observer {
    return firebaseAnalyticsObserver;
  }

  void open() {
    firebaseAnalytics.logAppOpen();
    _log('logAppOpen');
  }

  void currentScreen(String screenName) {
    firebaseAnalytics.setCurrentScreen(screenName: screenName);
    _log('setCurrentScreen, screenName: $screenName');
  }

  void user(String userId) {
    firebaseAnalytics.setUserId(userId);
    _log('setUserId, id: $userId');
  }

  void event(String name, [Map<String, dynamic> parameters]) {
    firebaseAnalytics.logEvent(name: name, parameters: parameters);
    _log('logEvent, name: $name, parameters: $parameters');
  }
}
