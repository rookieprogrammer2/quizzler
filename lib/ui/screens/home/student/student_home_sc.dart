import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/auth_provider.dart';
import 'package:quizzler/providers/role_provider.dart';

class StudentHomeScreen extends StatefulWidget {
  static const String routeName = "student_home_screen";

  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthenticationProvider>(context);
    var roleProvider = Provider.of<RoleProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "uid: ${FirebaseAuth.instance.currentUser!.uid}\n"
          "id: ${authProvider.databaseUser!.id}\n"
          "username: ${authProvider.databaseUser!.username}\n"
          "email: ${authProvider.databaseUser!.email}"
          "role from selectedRole: ${roleProvider.selectedRole}\n"
          "role from database: ${authProvider.databaseUser!.role}",
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
            fontFamily: "Montserrat",
          ),
        )
      ],
    );
  }
}
