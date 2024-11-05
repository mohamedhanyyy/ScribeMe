import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subcribe/services/shared_preferences/preferences_helper.dart';
import 'package:subcribe/shared/functions/general_functions.dart';
import 'package:subcribe/subcribe_me.dart';

import 'shared/functions/restart_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  GeneralFunctions.setPreferredOrientation();
  PreferencesHelper.init().then((_) {
    runApp(
      EasyLocalization(
          supportedLocales: const [Locale('ar'), Locale('en')],
          startLocale: Locale(PreferencesHelper.getLang),
          path: 'assets/translations',
          child: const RestartWidget(child: SubcribeApp())),
    );
  });
}
