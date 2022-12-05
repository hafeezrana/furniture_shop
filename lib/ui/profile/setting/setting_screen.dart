import 'package:flutter/material.dart';

import '../../../utils/widgets/reusable_card.dart';
import '../../../utils/widgets/text_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

List<bool> isSelected = [true, false];

class _SettingScreenState extends State<SettingScreen> {
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
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text('Setting', style: MyTextStyle.textStyle3b),
                const SizedBox(width: 10)
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Personal Information',
                      style: MyTextStyle.textStyle1),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_edit_outlined),
                  ),
                ],
              ),
            ),
            ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Name', style: MyTextStyle.textStyle1b),
                  TextField(
                    textAlign: TextAlign.start,
                    style: MyTextStyle.textStyle2b,
                    decoration: InputDecoration(
                      hintText: 'Hafeez Rana',
                      hintStyle: MyTextStyle.textStyle2b,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Email', style: MyTextStyle.textStyle1b),
                  TextField(
                    textAlign: TextAlign.start,
                    style: MyTextStyle.textStyle2b,
                    decoration: InputDecoration(
                      hintText: 'a@yahoo.com',
                      hintStyle: MyTextStyle.textStyle2b,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Password', style: MyTextStyle.textStyle1),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_edit_outlined),
                  ),
                ],
              ),
            ),
            ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Name', style: MyTextStyle.textStyle1b),
                  TextField(
                    textAlign: TextAlign.start,
                    style: MyTextStyle.textStyle2b,
                    decoration: InputDecoration(
                      hintText: '**********',
                      hintStyle: MyTextStyle.textStyle2b,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Notifications', style: MyTextStyle.textStyle1),
                ],
              ),
            ),
            ReusableCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sales',
                    style: MyTextStyle.textStyle2b,
                  ),
                  ToggleButtons(
                    onPressed: (index) {
                      setState(() {});
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    },
                    isSelected: isSelected,
                    children: const [
                      Text('Off'),
                      Text('On'),
                    ],
                  )
                ],
              ),
            ),
            ReusableCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Arrivals',
                    style: MyTextStyle.textStyle2b,
                  ),
                  ToggleButtons(
                    onPressed: (index) {
                      setState(() {});
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    },
                    isSelected: isSelected,
                    children: const [
                      Text('Off'),
                      Text('On'),
                    ],
                  )
                ],
              ),
            ),
            ReusableCard(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Delivery Status Changes',
                  style: MyTextStyle.textStyle1b,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Help Centre', style: MyTextStyle.textStyle1),
                ],
              ),
            ),
            ReusableCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'FAQ',
                    style: MyTextStyle.textStyle1b,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
