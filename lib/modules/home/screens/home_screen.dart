import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subcribe/core/extensions/context_extension.dart';
import 'package:subcribe/modules/pdf/presentation/screens/pdf_screen.dart';

import '../../../core/resources/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final pages=[
    const PdfScreen(),
    const Text(""),
    const Text(""),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: _selectedIndex == 0
                  ? AppColors.primaryColor.toColorFilter
                  : Colors.grey.toColorFilter,
            ),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/scan.svg',
              colorFilter: _selectedIndex == 1
                  ? AppColors.primaryColor.toColorFilter
                  : Colors.grey.toColorFilter,
            ),
            label: 'scan'.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              colorFilter: _selectedIndex == 2
                  ? AppColors.primaryColor.toColorFilter
                  : Colors.grey.toColorFilter,
            ),
            label: 'profile'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
