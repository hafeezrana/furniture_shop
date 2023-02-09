import 'package:flutter/material.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusable_card.dart';

import '../utils/constants/images_consts.dart';
import '../utils/widgets/text_style.dart';

class ReviewsAndRatingScreen extends StatefulWidget {
  const ReviewsAndRatingScreen({super.key});

  static const String route = '/reviewsnRatingScrn';

  @override
  State<ReviewsAndRatingScreen> createState() => _ReviewsAndRatingScreenState();
}

class _ReviewsAndRatingScreenState extends State<ReviewsAndRatingScreen> {
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
                  const Text('Rating & Reviews',
                      style: MyTextStyle.textStyle3b),
                  const SizedBox()
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
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Coffee Table', style: MyTextStyle.textStyle2),
                          Text('4.5', style: MyTextStyle.textStyle3b),
                          Text('10 Reviews', style: MyTextStyle.textStyle1b)
                        ],
                      ),
                    ),
                  ],
                ),

                //   );
                // }
              ),
              const Divider(color: ConstColors.black2),

              Stack(
                children: [
                  ReusableCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Maaz Uddin Hajveri',
                                  style: MyTextStyle.textStyle1b),
                              Text('12/3/2022')
                            ],
                          ),
                        ),
                        const Icon(Icons.star),
                        const SizedBox(height: 10),
                        const Text(
                          'Coffe Table is genuinly and amazing product. Delivered the same product in a short time.. nice service.. love this ... muaah...rofls',
                        )
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                        radius: 20, backgroundColor: ConstColors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ResuableButton(
          buttonText: 'Write a Review',
          onTap: () {},
        ),
      ),
    );
  }
}
