import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/colors.dart';

class ScribemePlusWidget extends StatelessWidget {
    const ScribemePlusWidget({super.key,required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: selectedIndex == 0
                  ? AppColors.secondaryColor
                  : AppColors.grey,
              width: 2)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                'ScribMe Plus'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              if(selectedIndex==0)
                Image.asset('assets/images/checkBlue.png')
            ],
          ),
            Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 12),
            child: Row(
              children: [
                const Text(
                  '\$4.99',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(width: 5),
                Text('per month'.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    )),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/check.svg'),
              const SizedBox(width: 5),
                Text(
                'Access 250 image descriptions.'.tr(),
                style: const TextStyle(color: AppColors.grey2),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/check.svg'),
                const SizedBox(width: 5),
                  Text(
                  'Unlock a wide range of voices.'.tr(),
                  style: const TextStyle(color: AppColors.grey2),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/check.svg'),
              const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    'Upload up to 3 images at time for processing in snap nScribe.'.tr(),
                    style: const TextStyle(color: AppColors.grey2),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
