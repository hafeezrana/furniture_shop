import 'package:flutter/material.dart';
import 'package:furniture_shop/authentication/auth_service.dart';
import 'package:furniture_shop/main.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/constants/images_consts.dart';
import 'package:furniture_shop/utils/widgets/reusable_card.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';
import 'package:go_router/go_router.dart';

import '../address/shipping_addresses.dart';
import '../myorders/order_screen.dart';
import '../payment/payment_methods_scrn.dart';
import '../reviews/my_reviews_screen.dart';
import '../setting/setting_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  static const route = '/profileScreen';

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search,
                          size: 30, color: ConstColors.black2)),
                  const Text('Profile', style: MyTextStyle.textStyle3b),
                  IconButton(
                    onPressed: () async {
                      await AuthService().signOut();

                      context.go(AuthStateChanges.route);
                    },
                    icon: const Icon(Icons.logout, color: ConstColors.black2),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    const SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          backgroundImage:
                              NetworkImage(ConstsImages.randomImage)),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hafeez Rana',
                          style: MyTextStyle.textStyle3
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Text('hafeez@gmail.com'),
                      ],
                    ),
                  ],
                ),
              ),
              MyProfileCard(
                text1: 'My Orders',
                text2: 'Already have 10 orders',
                onTap: () {
                  context.push(OrderScreen.route);
                },
              ),
              MyProfileCard(
                text1: 'Shipping Adresses',
                text2: '03 addresses',
                onTap: () {
                  context.push(ShippingAddressScreen.route);
                },
              ),
              MyProfileCard(
                text1: 'Payment Methods',
                text2: 'You have 2 cards',
                onTap: () {
                  context.push(PaymentMethodscrn.route);
                },
              ),
              MyProfileCard(
                text1: 'My Reviews',
                text2: 'Review for 3 items',
                onTap: () {
                  context.push(MyReviewScreen.route);
                },
              ),
              MyProfileCard(
                text1: 'Setting',
                text2: 'Notification, Password, FAQ, Contacts',
                onTap: () {
                  context.push(SettingScreen.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  MyProfileCard({String? text1, String? text2, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ReusableCard(
        child: ListTile(
          title: Text(text1!,
              style:
                  MyTextStyle.textStyle2.copyWith(fontWeight: FontWeight.w600)),
          subtitle: Text(text2!),
          trailing: IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward_ios_rounded)),
        ),
      ),
    );
  }
}
