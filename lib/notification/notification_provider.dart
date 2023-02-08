import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final notificationProvider =
    ChangeNotifierProvider<NotificationProvider>((ref) {
  return NotificationProvider();
});

class NotificationProvider with ChangeNotifier {
  // PushNotification? _notification;

  Future<void> _backGroundHandler(RemoteMessage message) async {
    print(message);
  }

  Future<void> registerNotification() async {
    FirebaseMessaging.onBackgroundMessage(_backGroundHandler);

    var token = await FirebaseMessaging.instance.getToken();
    debugPrint(' my token is : $token');

    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        debugPrint(' mymessage :  ${message.notification?.title}');
        // PushNotification notification = PushNotification(
        //   title: message.notification?.title,
        //   body: message.notification?.body,
        //   dataTitle: message.data['title'],
        //   dataBody: message.data['body'],
        // );
        // _notification = notification;
      });
    } else {
      print('user Declined Permission');
    }
  }

  checkForInitialMessage() async {
    // RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // if (initialMessage != null) {
    //   PushNotification notification = PushNotification(
    //     title: initialMessage.notification?.title,
    //     body: initialMessage.notification?.body,
    //     dataTitle: initialMessage.data['title'],
    //     dataBody: initialMessage.data['body'],
    //   );

    //   _notification = notification;
    // }
  }

  Future<void> sendNotification() async {
    try {
      final body = {
        "to":
            "cal-pf9vSPaQDPUyPMAEld:APA91bEz8pgn49fS-p-robZE2vz993z7_qZ1pqudxwqqKrWN9I25gBjOakZxV8FpBthl7NF1eFOpS4UdpcmYArBnmWUvdmn9dm0lsgguFbcnbFBVRB8RByipRhj0YkzJRC6c08MpCglM",
        "notification": {
          "title": "Mr. Hafeez",
          "body": "Flutter Dcotor Developer"
        }
      };

      final response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'key=AAAAARgfX3k:APA91bGhgQmD0eiN_5ZazLHQpcNg1js9MXII4gkvfOlgmyD8ZzrloxY3_X8Q_MmtPUCYdadcSYn21k6D25u0by1LyD0ZHZZi8dK_BM3_YRgpBDI8umTq4eTJFCFC3CvY7lapofz7tGCeAAAAARgfX3k:APA91bGhgQmD0eiN_5ZazLHQpcNg1js9MXII4gkvfOlgmyD8ZzrloxY3_X8Q_MmtPUCYdadcSYn21k6D25u0by1LyD0ZHZZi8dK_BM3_YRgpBDI8umTq4eTJFCFC3CvY7lapofz7tGCe',
        },
        body: jsonEncode(body),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

// class PushNotification {
//   String? title;
//   String? body;
//   String? dataTitle;
//   String? dataBody;
//   String? fcmToken;

//   PushNotification({
//     this.title,
//     this.body,
//     this.dataTitle,
//     this.dataBody,
//     this.fcmToken,
//   });
// }
