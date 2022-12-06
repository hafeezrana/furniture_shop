import 'package:flutter/material.dart';

import '../constants/colors_consts.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.child, super.key});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstColors.white,
      elevation: 4,
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
