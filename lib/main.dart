import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/ui/screens/home/lecturer/lecturer_tab_view.dart';
import 'package:quizzler/ui/screens/home/student/student_home_sc.dart';
import 'package:quizzler/ui/screens/quiz/quiz_screen.dart';
import 'package:quizzler/providers/role_provider.dart';
import 'package:quizzler/providers/settings_provider.dart';
import 'package:quizzler/providers/auth_provider.dart';
import 'package:quizzler/ui/screens/home/lecturer/lecturer_home_sc.dart';
import 'package:quizzler/ui/screens/home/student/student_tab_view.dart';
import 'package:quizzler/ui/screens/landing_screen.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/ui/screens/register/register_sc.dart';
import 'package:quizzler/ui/screens/settings/settings_screen.dart';
import 'package:quizzler/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => RoleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      theme: MyThemeData.lightTheme,
      darkTheme: ThemeData(),
      themeMode: settingsProvider.themeMode,
      */
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LandingScreen.routeName: (_) => const LandingScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        QuizCreationScreen.routeName: (_) => const QuizCreationScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        StudentTabView.routeName: (_) => const StudentTabView(),
        StudentHomeScreen.routeName: (_) => const StudentHomeScreen(),
        LecturerTabView.routeName: (_) => const LecturerTabView(),
        LecturerHomeScreen.routeName: (_) => const LecturerHomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }

}
