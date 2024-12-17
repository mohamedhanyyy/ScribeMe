import 'package:flutter/material.dart';
import 'package:subcribe/core/resources/colors.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';

import '../../../shared/widgets/custom_appbar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key, required this.hasBack});
  final bool hasBack;

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:
            widget.hasBack ? const BackButtonWidget() : const SizedBox.shrink(),
        title: const Text(
          "Subscriptions",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Plan',
                  style: TextStyle(
                    color: Color(0xff3D3D3D),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '13 days left',
                  style: TextStyle(
                    color: Color(0xff7A7A7A),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 17),
            Text(
              'ScribeMe Pro',
              style: TextStyle(
                color: Color(0xff3D3D3D),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              'Includes 500 image descriptions.',
              style: TextStyle(
                color: Color(0xff7A7A7A),
                fontSize: 16,
              ),
            ),
            Text(
              'Unlock voices for spoken descriptions.',
              style: TextStyle(
                color: Color(0xff7A7A7A),
                fontSize: 16,
              ),
            ),
            Text(
              'Upload up to 6 images in the same time.',
              style: TextStyle(
                color: Color(0xff7A7A7A),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(onTap: () {}, buttonText: 'Recharge'),
            CustomElevatedButton(
              onTap: () {},
              buttonText: 'Cancel Subscription',
              color: AppColors.whiteColor,
              borderColor: AppColors.whiteColor,
              fontColor: AppColors.blackColor,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
