import 'package:flutter/material.dart';

import '../../../utils/constants/colors_consts.dart';
import '../../../utils/constants/images_consts.dart';
import '../../../utils/widgets/reusable_card.dart';
import '../../../utils/widgets/text_style.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios,
                        color: ConstColors.black),
                  ),
                  const Text('My Reviews', style: MyTextStyle.textStyle3b),
                  const Icon(Icons.search, color: ConstColors.black),
                ],
              ),
              // ListView.separated(
              //     separatorBuilder: (context, index) {
              //       return const Divider();
              //     },
              //     itemCount: 1,
              //     itemBuilder: (context, index) {
              //       return
              const SizedBox(height: 10),
              SizedBox(
                child: ReusableCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(ConstsImages.randomImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('Coffee Table',
                                      style: MyTextStyle.textStyle2),
                                  Text('\$ 25', style: MyTextStyle.textStyle2b),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Icon(Icons.star), Text('12/3/2022')],
                        ),
                      ),
                      const Text(
                          'Coffe Table is genuinly and amazing product. Delivered the same product in a short time.. nice service.. love this ... muaah...rofls')
                    ],
                  ),
                ),
                //   );
                // }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
