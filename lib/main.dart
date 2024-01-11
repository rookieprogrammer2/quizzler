import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/ui/screens/quiz/quiz_screen.dart';
import 'package:quizzler/providers/role_provider.dart';
import 'package:quizzler/providers/settings_provider.dart';
import 'package:quizzler/providers/auth_provider.dart';
import 'package:quizzler/ui/screens/home/home_sc.dart';
import 'package:quizzler/ui/screens/home/student_home_screen.dart';
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
      locale: Locale(settingsProvider.currentLocale),
       localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      */
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LandingScreen.routeName: (_) => LandingScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuizCreationScreen.routeName: (_) => QuizCreationScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        StudentHomeScreen.routeName: (_) => StudentHomeScreen()
      },
      initialRoute: RegistrationScreen.routeName,
    );
  }

}
