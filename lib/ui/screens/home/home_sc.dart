import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/ui/screens/settings/settings_sc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {}, /// Todo -> quiz creation logic
        shape: const StadiumBorder(
          side: BorderSide(
            width: 4,
            color: Colors.white,
          ),
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue,
        elevation: 0,
        notchMargin: 10,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
          currentIndex: tabIndex,
          elevation: 0,
          onTap: (index) {
              tabIndex = index;
              setState(() {});
          },
        ),
      ),
      body: tabIndex == 0 ? Center(
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
      ) : const SettingsScreen()
    );
  }
}
