import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login_sc.dart';
import 'package:quizzler/ui/screens/register_sc.dart';
import 'package:quizzler/ui/screens/splash_sc.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
      },
      home: const LoginScreen(),
    ),
  );
}
