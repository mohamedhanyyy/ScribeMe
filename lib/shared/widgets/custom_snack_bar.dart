import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/resources/colors.dart';

class CustomSnackBars {
  static void showSuccessToast({required String title, Toast? length}) {
    Fluttertoast.showToast(
        msg: title.tr(),
        toastLength: length ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: AppColors.whiteColor,
        fontSize: 16.0);
  }

  static void showErrorToast({required String title, Toast? length}) {
    Fluttertoast.showToast(
      msg: title.tr(),
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: AppColors.whiteColor,
      fontSize: 16.sp,
    );
  }
}
