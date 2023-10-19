import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late final NotificationService notificationService;
  late final BuildContext context; 

   Future<void> initialize() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
    );
    // _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging
        .getToken()
        .then((token) => print("Token = " + token.toString()));
  }

  

}
