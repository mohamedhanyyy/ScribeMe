import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/resources/colors.dart';
// import '../resources/colors.dart';

class CustomSnackBars {
  static void showSuccessToast({required String title, Toast? length}) {
    Fluttertoast.showToast(
        msg: title.tr(),
        toastLength: length ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.greenColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0);
  }

  static void showErrorToast({required String title, Toast? length}) {
    Fluttertoast.showToast(
      msg: title.tr(),
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.pinkColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.sp,
    );
  }
}
