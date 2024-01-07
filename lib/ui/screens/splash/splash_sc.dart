import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/user_provider.dart';
import 'package:quizzler/ui/screens/home/home_sc.dart';
import 'package:quizzler/ui/screens/landing/landing_sc.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
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
          navigate();
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

  void navigate() async {
    var authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    if (authProvider.isAuthenticated()) {
      await authProvider.retrieveUserFromDatabase();
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
}
