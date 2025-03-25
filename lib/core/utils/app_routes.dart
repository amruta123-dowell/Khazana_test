import 'package:flutter/material.dart';
import 'package:khazana_test/presentation/auth_screen/auth_screen.dart';
import 'package:khazana_test/presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splash";
  static const String authScreen = "/auth_screen";

  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    authScreen: AuthScreen.builder,
  };
}
