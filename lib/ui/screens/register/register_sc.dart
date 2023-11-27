import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/database/models/user.dart' as MyUser;
import 'package:quizzler/database/users_dao.dart';
import 'package:quizzler/providers/user_provider.dart';
import 'package:quizzler/ui/screens/home/home_tab.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/utilities/dialogs.dart';
import 'package:quizzler/utilities/fieldValidations.dart';
import 'package:quizzler/widgets/textField.dart';


class RegistrationScreen extends StatefulWidget {
  static const routeName = "registration_sc";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController pwdEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController userNameEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headerText(width, height),
              SizedBox(height: height * 0.04),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(bottom: height * 0.12),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 71, 212, 76),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200),
                        ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.15, vertical: height * 0.05),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: height * 0.085),
                          Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                MyTextFormField(
                                  /// Todo -> add another validation rule that makes sure the Username does not already exist.
                                  hintText: "Username",
                                  isObscure: false,
                                  textEditingController: userNameEditingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) =>
                                      FormValidator.validateUsername(value),
                                ),
                                MyTextFormField(

                                    /// Todo -> add another validation rule that makes sure the E-mail does not already exist.
                                    isObscure: false,
                                    hintText: "Email",
                                    textEditingController: emailEditingController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) =>
                                        FormValidator.validateEmail(value)),
                                MyTextFormField(
                                  validator: (value) =>
                                      FormValidator.validatePassword(value),
                                  textEditingController: pwdEditingController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hintText: "Password",
                                  isObscure: true,
                                  suffixIcon: const IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                MyTextFormField(
                                  validator: (value) => FormValidator
                                      .validatePasswordConfirmation(
                                          value, pwdEditingController.text),
                                  keyboardType: TextInputType.visiblePassword,
                                  hintText: "Confirm Password",
                                  isObscure: true,
                                  suffixIcon: const IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.077),
                          createAccountButton(width, height),
                          SizedBox(height: height * 0.02),
                          clickableLoginText(context),
                          SizedBox(height: height * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding headerText(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Register",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Container createAccountButton(double width, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.079),
      child: ElevatedButton(
        onPressed: () {
          createAccount();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: const Center(
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Row clickableLoginText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Or ",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          child: const Text(
            "Login ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
          ),
        ),
        const Text(
          "Instead",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  void createAccount() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    var authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      MyDialogs.showLoadingDialog(context);
      await authProvider.register(emailEditingController.text, pwdEditingController.text, userNameEditingController.text);

      MyDialogs.dismissDialog(context);
      MyDialogs.showCustomDialog(context, dialogMessage: "Account created successfully!", isDismissible: true, positiveActionName: "Ok", positiveAction: () {Navigator.pushReplacementNamed(context, LoginScreen.routeName);});
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        MyDialogs.showCustomDialog(context, dialogMessage: "This email is already in use.", isDismissible: true, positiveActionName: "Ok", positiveAction: () {Navigator.pop(context);});
      } else {
        MyDialogs.showCustomDialog(context, dialogMessage: "Error: ${e.code}", isDismissible: true, positiveActionName: "Ok", positiveAction: () {Navigator.pop(context);});
      }
    }
  }

  void checkCurrAuthState () {
    /* "authStateChanges" is a method provided by the Firebase Authentication plugin
         that returns a STREAM of changes to the authentication state --the user sign-in state.
       That STREAM emits events --Asynchronously-- whenever the user's sign in state changes.

       The "listen" method is called on the stream that is returned by the "authStateChanges" method,
         and one of its parameters is a call-back function. It is executed whenever the authentication
         state changes --whenever the user sign-in state changes.
       The call-back function takes an object of the type "User" that represents a
         a user in Firebase Authentication. */
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }


}
