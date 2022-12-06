import 'package:flutter/material.dart';

class ReUsableTextFField extends StatelessWidget {
  const ReUsableTextFField({
    Key? key,
    this.hintText,
    required this.labelText,
    this.readOnly = false,
    this.validator,
    this.icon,
    this.controller,
  }) : super(key: key);

  final String? hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        hintStyle: const TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
      ),
    );
  }
}
