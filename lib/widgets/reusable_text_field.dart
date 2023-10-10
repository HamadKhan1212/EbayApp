import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String? Function(String?)? validation;
  final bool visibility;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final Color filledColor;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showPassword;

  const ReusableTextField({
    super.key,
    this.validation,
    this.visibility = false,
    this.hintText,
    this.labelText,
    this.controller,
    this.filledColor = Colors.grey,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.showPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      obscureText: visibility,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          filled: filled,
          fillColor: filledColor,
          border: InputBorder.none,
          prefix: prefixIcon,
          suffixIcon: suffixIcon,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1))),
    );
  }
}
