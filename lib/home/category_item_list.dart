import 'package:flutter/material.dart';

import '../utils/constants/colors_consts.dart';

class CategoryItemList extends StatelessWidget {
  CategoryItemList({super.key});

  final _icons = [
    Icons.star,
    Icons.chair_alt_rounded,
    Icons.table_bar_outlined,
    Icons.chair,
    Icons.bed_outlined,
    Icons.door_back_door_outlined,
    Icons.window_rounded,
  ];

  final _titles = [
    'Popular',
    'Chair',
    'Table',
    'Armchair',
    'Bed',
    'Door',
    'Window',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _titles.length,
      itemBuilder: (context, index) {
        final icon = _icons[index];
        final title = _titles[index];
        return ReusableContainer1(
          icon: icon,
          title: title,
          onTap: () {},
        );
      },
    );
  }

  Widget ReusableContainer1({
    IconData? icon,
    String? title,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ConstColors.white,
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: ConstColors.black2,
                size: 34,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title!),
            ),
          ],
        ),
      ),
    );
  }
}
