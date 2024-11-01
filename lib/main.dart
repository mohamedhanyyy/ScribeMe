import 'package:flutter/material.dart';
 import 'package:subcribe/services/shared_preferences/preferences_helper.dart';
import 'package:subcribe/shared/functions/general_functions.dart';
import 'package:subcribe/subcribe_me.dart';

import 'shared/functions/restart_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   GeneralFunctions.setPreferredOrientation();
  PreferencesHelper.init().then((_) {
    runApp(
      const RestartWidget(child: SubcribeApp()),
    );
  });

}
