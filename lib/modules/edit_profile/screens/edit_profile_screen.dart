import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subcribe/modules/auth/presentation/screens/change_password_screen.dart';

import '../../../core/resources/colors.dart';
import '../../../services/navigation/navigation.dart';
import '../../profile/screens/profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title:   Text('manage profile'.tr(),
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildMenuItem(

              icon: 'edit',
              title: "Edit Profile",
              onTap: () {
                // AppNavigation.navigate(const EditProfileScreen());
              },
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              icon: 'lock',
              title: "Change Password",
              onTap: () {
                AppNavigation.navigate(  ChangePasswordScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
