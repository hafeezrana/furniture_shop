import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/notification/notification_provider.dart';

import '../utils/constants/colors_consts.dart';
import '../utils/constants/images_consts.dart';
import '../utils/widgets/text_style.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  static const route = '/notificationScreen';

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    ref.read(notificationProvider).registerNotification();
    ref.read(notificationProvider).checkForInitialMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(notificationProvider);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text('add'),
        onPressed: () {
          provider.sendNotification();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              // _notification == null
              //     ? const Center(child: Text('No notification found'))
              //     :
              //  Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'TITLE: ${_notification?.title}',
              //         style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16.0,
              //         ),
              //       ),
              //       const SizedBox(height: 8.0),
              //       Text(
              //         'BODY: ${_notification?.body}',
              //         style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16.0,
              //         ),
              //       ),
              //     ],
              //   ),

              Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.search, size: 30, color: ConstColors.black2),
                  Text('Notifications', style: MyTextStyle.textStyle3b),
                  SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ConstsImages.randomImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text('Your order #283783 has been confirmed',
                                style: MyTextStyle.textStyle2
                                    .copyWith(fontWeight: FontWeight.w700),
                                maxLines: 2),
                          ),
                          const Flexible(
                            child: Text(
                                'Lorem Lipsum product color is mostly used by women with better usagea and results',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
