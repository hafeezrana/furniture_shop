import 'package:flutter/material.dart';

import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

class ResuableButton extends StatelessWidget {
  const ResuableButton({
    super.key,
    this.buttonText,
    this.textColor,
    this.onTap,
  });

  final String? buttonText;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width / 1.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ConstColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 14,
          ),
          onPressed: onTap,
          child: Text(
            buttonText!,
            style: MyTextStyle.textStyle2.copyWith(
              color: ConstColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
