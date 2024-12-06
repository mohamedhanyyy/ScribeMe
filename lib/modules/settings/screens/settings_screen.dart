import 'package:flutter/material.dart';
import 'package:subcribe/shared/widgets/custom_divider.dart';

import '../../../core/resources/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notif = false;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
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
            const Text(
              "Sound",
              style: TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Image.asset('assets/images/notif.png'),
                const SizedBox(width: 10),
                const Text(
                  'Notifications',
                  style:
                      TextStyle(color: AppColors.greyProfileText, fontSize: 14),
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
                    })
              ],
            ),
            const SizedBox(height: 30),
            const CustomDivider(),

            SizedBox(height: 10),
            const Text(
              "Themes",
              style: TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Image.asset('assets/images/moon.png'),
                const SizedBox(width: 10),
                const Text(
                  'Dark mode',
                  style:
                  TextStyle(color: AppColors.greyProfileText, fontSize: 14),
                ),
                const Spacer(),
                Switch.adaptive(
                    activeColor: AppColors.primaryColor,
                    inactiveThumbColor: AppColors.primaryColor,
                    value: darkMode,
                    onChanged: (val) {
                      setState(() {
                        darkMode = val;
                      });
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
