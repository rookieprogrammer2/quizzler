import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/database/user_dao.dart';
import 'package:quizzler/database/models/user_model.dart' as MyUser;

class RoleProvider extends ChangeNotifier {
  String _selectedRole = "Student";

  String get selectedRole => _selectedRole;

  void updateSelectedRole(String? newRole) {
    _selectedRole = newRole!;
    notifyListeners();
  }

}
