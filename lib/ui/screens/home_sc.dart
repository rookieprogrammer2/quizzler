import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login_sc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: NavigationBar(height: 60, destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ]),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              LoginScreen.routeName,
            );
          },
          child: const Text(
            "Login",
          ),
        ),
      ),
    );
  }
}
