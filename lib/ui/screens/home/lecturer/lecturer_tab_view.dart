import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/role_provider.dart';
import 'package:quizzler/ui/screens/home/lecturer/lecturer_home_sc.dart';
import 'package:quizzler/ui/screens/home/lecturer/lecturer_tab_view.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/ui/screens/quiz/quiz_screen.dart';
import 'package:quizzler/ui/screens/settings/settings_screen.dart';

class LecturerTabView extends StatefulWidget {
  static const routeName = "lecturer_tab_view";

  const LecturerTabView({super.key});

  @override
  State<LecturerTabView> createState() => _LecturerTabViewState();
}

class _LecturerTabViewState extends State<LecturerTabView> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var roleProvider = Provider.of<RoleProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, QuizCreationScreen.routeName);
        },

        /// Todo -> quiz creation logic
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
      body: tabIndex == 0
          ? const LecturerHomeScreen()
          : const SettingsScreen(),
    );
  }
}
