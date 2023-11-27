import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/settings_provider.dart';
import 'package:quizzler/ui/screens/home/home_tab.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/ui/screens/register/register_sc.dart';
import 'package:quizzler/ui/screens/splash/splash_sc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
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
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegistrationScreen.routeName: (_) => RegistrationScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }

}
