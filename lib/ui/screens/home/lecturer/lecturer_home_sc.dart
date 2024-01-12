import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/auth_provider.dart';
import 'package:quizzler/providers/role_provider.dart';

class LecturerHomeScreen extends StatefulWidget {
  static const String routeName = "lecturer_home_screen";

  const LecturerHomeScreen({super.key});

  @override
  State<LecturerHomeScreen> createState() => _LecturerHomeScreenState();
}

class _LecturerHomeScreenState extends State<LecturerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var roleProvider = Provider.of<RoleProvider>(context);
    var authProvider = Provider.of<AuthenticationProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
