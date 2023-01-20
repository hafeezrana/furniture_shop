import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop/model/notification.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const route = '/notificationScreen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  PushNotification? _notification;

  Future<void> _backGroundHandler(RemoteMessage message) async {
    print(message);
  }

  void registerNotification() async {
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
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );
        setState(() {
          _notification = notification;
        });
        if (_notification != null) {
          showSimpleNotification(
            Text(_notification!.title!),
            subtitle: Text(_notification!.body!),
            background: Colors.cyan.shade700,
            duration: const Duration(seconds: 2),
          );
        } else {}
      });
    } else {
      print('user Declined Permission');
    }
  }

  checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      setState(() {
        _notification = notification;
      });
    }
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
              'key=AAAAARgfX3k:APA91bGhgQmD0eiN_5ZazLHQpcNg1js9MXII4gkvfOlgmyD8ZzrloxY3_X8Q_MmtPUCYdadcSYn21k6D25u0by1LyD0ZHZZi8dK_BM3_YRgpBDI8umTq4eTJFCFC3CvY7lapofz7tGCe',
        },
        body: jsonEncode(body),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    registerNotification();
    checkForInitialMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text('add'),
        onPressed: () {
          sendNotification();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _notification == null
              ? const Center(child: Text('No notification found'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TITLE: ${_notification?.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'BODY: ${_notification?.body}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: const [
          //         Icon(Icons.search, size: 30, color: ConstColors.black2),
          //         Text('Notifications', style: MyTextStyle.textStyle3b),
          //         SizedBox(width: 10),
          //       ],
          //     ),
          //     const SizedBox(height: 10),
          //     SizedBox(
          //       height: MediaQuery.of(context).size.height / 8,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           SizedBox(
          //             height: 90,
          //             width: MediaQuery.of(context).size.width / 3.5,
          //             child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(8),
          //                 child: Image.network(ConstsImages.randomImage,
          //                     fit: BoxFit.cover)),
          //           ),
          //           SizedBox(
          //             height: 100,
          //             width: MediaQuery.of(context).size.width / 1.5,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 SizedBox(
          //                   child: Text('Your order #283783 has been confirmed',
          //                       style: MyTextStyle.textStyle2
          //                           .copyWith(fontWeight: FontWeight.w700),
          //                       maxLines: 2),
          //                 ),
          //                 const Text(
          //                     'Lorem Lipsum product color is mostly used by women with better usagea and results',
          //                     maxLines: 3,
          //                     overflow: TextOverflow.ellipsis),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
