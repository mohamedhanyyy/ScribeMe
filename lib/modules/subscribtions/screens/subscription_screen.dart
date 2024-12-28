import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subcribe/core/cubit/base_cubit_state.dart';
import 'package:subcribe/core/resources/colors.dart';
import 'package:subcribe/modules/subscribtions/cubit/subscribe_cubit.dart';
import 'package:subcribe/modules/subscribtions/widgets/scribe_me_pro.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';
import 'package:subcribe/shared/widgets/custom_loading_widget.dart';

import '../../../shared/widgets/custom_appbar.dart';
import '../widgets/scribeme_plus_widget.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key, required this.hasBack});
  final bool hasBack;

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late SubscribeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SubscribeCubit>();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading:
      //       widget.hasBack ? const BackButtonWidget() : const SizedBox.shrink(),
      //   title:   Text(
      //     "Upgrade".tr(),
      //     style: const TextStyle(
      //       color: AppColors.primaryColor,
      //       fontSize: 16,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //         Text(
      //         "Pick Your Plan".tr(),
      //         style: const TextStyle(
      //           color: Color(0xff888888),
      //           fontSize: 14,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 8.0, bottom: 10),
      //         child: GestureDetector(
      //           onTap: () {
      //             selectedIndex = 0;
      //             setState(() {});
      //           },
      //           child: ScribemePlusWidget(selectedIndex: selectedIndex),
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           selectedIndex = 1;
      //           setState(() {});
      //         },
      //         child: ScribemeProWidget(selectedIndex: selectedIndex),
      //       ),
      //         Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 8.0),
      //         child: Text('Important Note:'.tr(),
      //       ),
      //         ), Text(
      //         'quote'.tr(),
      //         style: const TextStyle(
      //           color: AppColors.grey2,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: BlocBuilder<SubscribeCubit, BaseCubitState>(
      //     builder: (context, state) {
      //       if (state == BaseCubitState.loading) {
      //         return const CustomLoadingButtonWidget();
      //       }
      //       return CustomElevatedButton(
      //           onTap: () {
      //             cubit.subscribe(selectedIndex);
      //           },
      //           buttonText: 'Subscribe',
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
