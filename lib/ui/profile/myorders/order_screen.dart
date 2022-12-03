import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';

import '../../../utils/widgets/reusable_card.dart';
import '../../../utils/widgets/text_style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Delivered',
      'Processing',
      'Canceled',
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ConstColors.black,
              ),
            ),
            backgroundColor: Colors.white,
            title: Text(
              'My Orders', //
              style: MyTextStyle.textStyle3b.copyWith(
                color: ConstColors.black,
              ),
            ),
            elevation: 0,
            bottom: TabBar(
              indicatorColor: ConstColors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              indicatorPadding: const EdgeInsets.all(10),
              tabs: [
                SizedBox(
                  height: 40,
                  child: Text(
                    'Delivered',
                    style: MyTextStyle.textStyle2
                        .copyWith(color: ConstColors.black),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    'Processing',
                    style: MyTextStyle.textStyle2
                        .copyWith(color: ConstColors.black),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    'Canceled',
                    style: MyTextStyle.textStyle2
                        .copyWith(color: ConstColors.black),
                  ),
                ),
              ],
            )),
        body: Center(
          child: TabBarView(
            children: tabs
                .map(
                  (e) => Center(
                      child: SizedBox(
                    height: 140,
                    child: ReusableCard(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Order No238427',
                                style: MyTextStyle.textStyle2b,
                              ),
                              Text(
                                '03/12/2022',
                                style: MyTextStyle.textStyle2,
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Quantity: 02',
                                style: MyTextStyle.textStyle2,
                              ),
                              Text(
                                'Total amout: \$ 200',
                                style: MyTextStyle.textStyle2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Detail',
                                  style: MyTextStyle.textStyle2b
                                      .copyWith(color: ConstColors.black),
                                ),
                              ),
                              Text(
                                e,
                                style: MyTextStyle.textStyle2b
                                    .copyWith(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Delivered() {
    return ReusableCard(
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.start,
            style: MyTextStyle.textStyle2.copyWith(fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: 'Dr Flutter',
              hintStyle:
                  MyTextStyle.textStyle2.copyWith(fontWeight: FontWeight.w600),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          const Divider(),
          TextField(
            textAlign: TextAlign.start,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Your Address is here',
              hintStyle:
                  MyTextStyle.textStyle1.copyWith(fontWeight: FontWeight.w600),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget TabContainer(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          // color: ConstColors.green,
        ),
        height: 35,
        width: double.maxFinite / 3,
        child: Center(
          child: Text(
            text,
            // style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),

            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
