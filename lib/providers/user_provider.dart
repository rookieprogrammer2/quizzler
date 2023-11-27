import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/database/models/user.dart' as MyUser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizzler/database/users_dao.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? firebaseAuthenticationUser;
  MyUser.User? databaseUser;

  Future<void> register (
      String emailEditingController,
      String pwdEditingController,
      String userNameEditingController
      ) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditingController,
        password: pwdEditingController
    );
    await UsersDAO.createUser(
        MyUser.User(
          id: credential.user?.uid,
          username: userNameEditingController,
          email: emailEditingController,
        ));
  }
}