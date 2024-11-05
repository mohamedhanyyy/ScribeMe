import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subcribe/services/navigation/navigation.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/icons.dart';

class CustomAppbar extends StatelessWidget {
  final String text;

  const CustomAppbar(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xffF9F7F7),
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                AppNavigation.pop();
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                child: SvgPicture.asset(AppIcons.backButton),
              ),
            ),
            Text(
              text.tr(),
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey),
            )
          ],
        ));
  }
}
