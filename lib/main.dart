import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login_sc.dart';
import 'package:quizzler/ui/screens/pass_reset_sc.dart';
import 'package:quizzler/ui/screens/register_sc.dart';
import 'package:quizzler/ui/screens/splash_sc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        PasswordReset.routeName: (_) => const PasswordReset(),
      },
      home: const LoginScreen(),
    ),
  );
}
