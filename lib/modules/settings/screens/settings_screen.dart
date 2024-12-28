import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subcribe/core/extensions/context_extension.dart';
import 'package:subcribe/modules/home/screens/home_screen.dart';
import 'package:subcribe/shared/functions/restart_app.dart';
import 'package:subcribe/shared/widgets/custom_divider.dart';

import '../../../core/resources/colors.dart';
import '../../../services/cache/cache_helper.dart';
import '../../../services/navigation/navigation.dart';
import '../../../shared/widgets/custom_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notif = false;
  late bool darkMode;
  late int langCode;

  @override
  void initState() {
    super.initState();
    // Load dark mode preference from cache or default to false
    darkMode = CacheHelper.getDarkMode() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    langCode = context.isCurrentEnglish ? 1 : 0;

    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: Text(
          "settings".tr(),
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sound".tr(),
              style: const TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Image.asset('assets/images/notif.png'),
                const SizedBox(width: 10),
                Text(
                  'notifications'.tr(),
                  style: const TextStyle(
                      color: AppColors.greyProfileText, fontSize: 14),
                ),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.primaryColor,
                  inactiveThumbColor: AppColors.primaryColor,
                  value: notif,
                  onChanged: (val) {
                    setState(() {
                      notif = val;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 30),
            const CustomDivider(),
            const SizedBox(height: 10),
            Text(
              "Themes".tr(),
              style: const TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Image.asset('assets/images/moon.png'),
                const SizedBox(width: 10),
                Text(
                  'Dark mode'.tr(),
                  style: const TextStyle(
                      color: AppColors.greyProfileText, fontSize: 14),
                ),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.primaryColor,
                  inactiveThumbColor: AppColors.primaryColor,
                  value: darkMode,
                  onChanged: (val) {
                    setState(() {
                      darkMode = val;

                      CacheHelper.saveDarkMode(val);
                      // Notify the app about the theme change
                      RestartWidget.restartApp();
                    });
                  },
                ),
              ],
            ),
            const CustomDivider(),
            const SizedBox(height: 10),
            Text(
              "Language".tr(),
              style: const TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: 0,
              activeColor: AppColors.primaryColor,
              groupValue: langCode,
              onChanged: (val) {
                setState(() {
                  langCode = val!;
                  context.setLocale(const Locale('ar'));
                  CacheHelper.saveLang(lang: 'ar');
                  AppNavigation.navigateOffAll(const HomeScreen());
                });
              },
              title: Text(
                'العربية',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: 1,
              groupValue: langCode,
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                setState(() {
                  langCode = val!;
                });
                context.setLocale(const Locale('en'));
                CacheHelper.saveLang(lang: 'en');
                AppNavigation.navigateOffAll(const HomeScreen());
              },
              title: Text(
                'English',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
