import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/database/models/user_model.dart' as MyUser;
import 'package:quizzler/database/user_dao.dart';
import 'package:quizzler/providers/role_provider.dart';
import 'package:quizzler/ui/screens/home/lecturer/lecturer_tab_view.dart';
import 'package:quizzler/ui/screens/home/student/student_tab_view.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/utilities/dialogs.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? firebaseAuthenticationUser;
  MyUser.User? databaseUser;



  /* Firstly, the "register" method is called to create an authenticated user.
   The "createUserWithEmailAndPassword" method returns a "UserCredential" and stores it into "credential".
  Now, "credential" holds the result of the authentication operation, which includes information about
  the newly-created user. */
  Future<void> register(String emailController, String passwordController,
      String usernameController, String role) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController, password: passwordController);

/* Secondly: using the data passed into the "register" function,
  the "createUser" method creates a document within the "users" collection with the information passed to it.
 Note that the "uid" of that specific newly-created user is passed into the "id" parameter.
 "user?" is a method that is called on the "credential" variable, which holds an object of the class "UserCredential".
 This method returns a "User?", which holds more information and methods about the "UserCredential"
  object it was called on; in this case, "credential". */
    await UsersDAO.createUser(MyUser.User(
        id: credential.user?.uid,
        username: usernameController,
        email: emailController,
        role: role));
  }

  Future<void> login(String emailController, String passwordController,
      BuildContext context) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController, password: passwordController);

    var user = await UsersDAO.getUser(credential.user!.uid);
    updateDatabaseUser(user);
    /// databaseUser = user;
    firebaseAuthenticationUser = credential.user;
    var roleProvider = Provider.of<RoleProvider>(context, listen: false);
    roleProvider.updateSelectedRole(user?.role);
    if (user!.role == "Lecturer") {
      MyDialogs.dismissDialog(context);
      Navigator.pushReplacementNamed(context, LecturerTabView.routeName);
    }
    else if (user.role == "Student") {
      MyDialogs.dismissDialog(context);
      Navigator.pushReplacementNamed(context, StudentTabView.routeName);
    }
    else {
      print("else condition triggered. Error.");
      MyDialogs.showCustomDialog(context,
          dialogMessage: "Error", isDismissible: true);
    }
  }

  logout(BuildContext context) async {
    updateDatabaseUser(null);
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  void updateDatabaseUser (MyUser.User? user) {
    databaseUser = user;
    notifyListeners();
}
}
