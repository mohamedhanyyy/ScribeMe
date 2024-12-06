import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../core/resources/colors.dart';

const customButtonTextStyle = TextStyle(
    fontSize: 16, color: AppColors.whiteColor, fontWeight: FontWeight.w600);

class CustomElevatedButton extends StatelessWidget {
  final String? buttonText;
  final Function onTap;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final Widget? widget;
  final double? padding;
  final Color? color;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    required this.onTap,
    this.buttonText,
    this.borderRadius,
    this.fontColor,
    this.widget,
    this.height,
    this.borderColor,
    this.padding,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 48.h),
          elevation: 0,
          backgroundColor: color ?? AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.secondaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
        ),
        child: widget ??
            Text(buttonText!.tr(),
                textAlign: TextAlign.center,
                style: customButtonTextStyle.copyWith(
                    color: fontColor, fontSize: fontSize)),
      ),
    );
  }
}

class CustomCancelElevatedButton extends StatelessWidget {
  final double? padding;

  const CustomCancelElevatedButton({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48.h),
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'cancel'.tr(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16.sp,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class DisabledElevatedButton extends StatelessWidget {
  final String buttonText;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final double? padding;
  final Color? color;
  final Color? borderColor;

  const DisabledElevatedButton({
    super.key,
    required this.buttonText,
    this.borderRadius,
    this.fontColor,
    this.borderColor,
    this.padding,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48.h),
          elevation: 0,
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.primaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
        ),
        child: Text(
          buttonText.tr(),
          style: TextStyle(
            color: fontColor ?? AppColors.primaryColor,
            fontSize: fontSize ?? 16.sp,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
