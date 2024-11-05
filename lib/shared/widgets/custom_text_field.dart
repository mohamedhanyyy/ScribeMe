import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Color hintColor;
  final int? maxLines;
  final Color fillColor;
  final Color borderColor;
  final String? prefixIcon;
  final double borderRadius;
  final double? hintFontSize;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;

    const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines,
    this.borderRadius = 6,
    this.hintColor=const Color(0xff888888),
    this.hintFontSize,
    this.fillColor = Colors.white,
    this.borderColor = AppColors.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText?.tr(),
        contentPadding: EdgeInsets.zero,
        hintStyle:
            lightGrey15W400.copyWith(color: hintColor, fontSize: hintFontSize),
        labelStyle: lightGrey15W400,
        fillColor: fillColor,
        prefixIconConstraints: const BoxConstraints(),
        filled: true,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(prefixIcon!),
              )
            :const SizedBox(width: 10),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(suffixIcon!),
              )
            : const SizedBox(width: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(borderRadius)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
