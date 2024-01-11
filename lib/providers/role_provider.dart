import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/database/user_dao.dart';
import 'package:quizzler/database/models/user_model.dart' as MyUser;

class RoleProvider extends ChangeNotifier {
  String _selectedRole = "Student";

  String get selectedRole => _selectedRole;

  void updateSelectedRole(String newRole) {
    _selectedRole = newRole;
    notifyListeners();
  }

  String get userRole  {
    // FirebaseFirestore.instance.collection("users");
    String uid = FirebaseAuth.instance.currentUser!.uid;
    UsersDAO.usersCollection.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          if (documentSnapshot.get("role") == "Lecturer") {
            return "Lecturer";
          } else {
            return "Student";
          }
        } else {
          return "Document Snapshot Does not Exist";
        }
      }
      );
       return "I don't know";
  }


}
