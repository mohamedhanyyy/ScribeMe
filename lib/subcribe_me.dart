import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subcribe/modules/auth/presentation/screens/login_screen.dart';
import 'package:subcribe/modules/home/screens/home_screen.dart';
import 'package:subcribe/modules/pdf/presentation/cubit/image_summary_bloc.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/functions/general_functions.dart';
import 'package:subcribe/shared/themes/app_theme.dart';

import 'modules/auth/cubit/login_cubit.dart';
import 'modules/auth/cubit/sign_up_cubit.dart';
import 'modules/pdf/presentation/cubit/pdf_bloc.dart';

class SubcribeApp extends StatelessWidget {
  const SubcribeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return GestureDetector(
          onTap: GeneralFunctions.hideKeyboard,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => SignUpCubit()),
              BlocProvider(create: (context) => PdfSummaryBloc()),
              BlocProvider(create: (context) => ImageSummaryBloc()),
            ],
            child: MaterialApp(
              locale: context.locale,
              title: 'Scribe Me',
              theme: AppThemes.whiteTheme,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              navigatorKey: AppNavigation.navigatorKey,
              home: FirebaseAuth.instance.currentUser == null
                  ? const LoginScreen()
                  : const HomeScreen(),
            ),
          ),
        );
      },
    );
  }
}
