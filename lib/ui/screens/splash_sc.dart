import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login_sc.dart';
import 'package:quizzler/utilities/app_assets.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
            () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
            image: AssetImage(
                AppAssets.splashScreen,
            )
        )
      ),
    );
  }
}
