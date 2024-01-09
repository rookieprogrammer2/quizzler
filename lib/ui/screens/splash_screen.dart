import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/landing_screen.dart';
import 'package:quizzler/utilities/app_assets.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "splash_screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, LandingScreen.routeName));
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(AppAssets.splashScreen),
        ),
      ),
    );
  }
}
