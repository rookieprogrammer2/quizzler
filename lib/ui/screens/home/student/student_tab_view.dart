import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/role_provider.dart';
import 'package:quizzler/ui/screens/home/student/student_home_sc.dart';
import 'package:quizzler/ui/screens/settings/settings_screen.dart';

class StudentTabView extends StatefulWidget {
  static const routeName = "student_tab_view";

  const StudentTabView({super.key});

  @override
  State<StudentTabView> createState() => _StudentTabViewState();
}

class _StudentTabViewState extends State<StudentTabView> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
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
          ? const StudentHomeScreen()
          : const SettingsScreen(),
    );
  }
}


