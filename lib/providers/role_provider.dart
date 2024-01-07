import 'package:flutter/material.dart';

class RoleProvider extends ChangeNotifier {
  String _selectedRole = "Student";

  String get selectedRole => _selectedRole;

  void updateSelectedRole(String newRole) {
    _selectedRole = newRole;
    notifyListeners();
  }
}
