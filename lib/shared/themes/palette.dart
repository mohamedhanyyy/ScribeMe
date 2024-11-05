import 'package:flutter/material.dart';

class Palette {
  static MaterialColor kToDark = MaterialColor(
    Colors.white.value,
    <int, Color>{
      50: Colors.white.withOpacity(0.1),
      100: Colors.white.withOpacity(0.2),
      200: Colors.white.withOpacity(0.3),
      300: Colors.white.withOpacity(0.4),
      400: Colors.white.withOpacity(0.5),
      500: Colors.white.withOpacity(0.6),
      600: Colors.white.withOpacity(0.7),
      700: Colors.white.withOpacity(0.8),
      800: Colors.white.withOpacity(0.9),
      900: Colors.white,
    },
  );
}
