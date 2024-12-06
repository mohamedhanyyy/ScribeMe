import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColors.primaryColor,));
  }
}

class CustomLoadingButtonWidget extends StatelessWidget {
  const CustomLoadingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        return;
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(48.h),
        elevation: 0,
        backgroundColor: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      ),
      child: const CircularProgressIndicator(
          backgroundColor: AppColors.secondaryColor),
    );
  }
}
