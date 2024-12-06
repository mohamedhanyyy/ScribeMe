import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subcribe/services/cache/cache_helper.dart';

import 'package:subcribe/shared/functions/general_functions.dart';
import 'package:subcribe/subcribe_me.dart';

import 'shared/functions/restart_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GeneralFunctions.setPreferredOrientation();
  CacheHelper.init().then((_) {
    runApp(
      EasyLocalization(
          saveLocale: true,
          supportedLocales: const [Locale('ar'), Locale('en')],
          startLocale: Locale(CacheHelper.getLang),
          path: 'assets/translations',
          child: const RestartWidget(child: ScribeMeApp())),
    );
  });
}
