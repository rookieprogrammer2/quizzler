import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/home/home_tab.dart';
import 'package:quizzler/ui/screens/register/register_sc.dart';
import 'package:quizzler/utilities/dialogs.dart';
import 'package:quizzler/utilities/fieldValidations.dart';
import 'package:quizzler/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../database/users_dao.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_sc";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController pwdEditingController = TextEditingController();
  CollectionReference usersCollection = FirebaseFirestore.instance.collection("Users");
  var formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headerText(width, height),
            SizedBox(height: height * 0.09),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: height * 0.1),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 35, 168, 51),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.15, vertical: height * 0.01),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: height * 0.085),
                        Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              MyTextFormField(
                                hintText: "Email",
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: emailEditingController,
                                validator: (value) => FormValidator.validateEmail(value),

                              ),
                              MyTextFormField(
                                isObscure: _obscureText,
                                hintText: "Password",
                                keyboardType: TextInputType.visiblePassword,
                                textEditingController: pwdEditingController,
                                validator: (value) => FormValidator.validatePassword(value),
                                suffixIcon: IconButton(
                                        onPressed: (){
                                          _obscureText = !_obscureText;
                                          print("ICON CLICKED!");
                                          setState(() {});
                                        },
                                        icon: _obscureText ? const Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          size: 18,
                                        ) : const Icon(
                                            Icons.visibility_off,
                                        color: Colors.white,
                                          size: 18,
                                        ),
                                    ),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.077),
                        loginButton(width, height),
                        SizedBox(height: height * 0.02),
                        clickableRegisterText(context),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  /// <== Clickable Register Text <== ///
  Column clickableRegisterText(BuildContext context) {
    return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                              ],
                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RegistrationScreen.routeName);
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        );
  }

  /// <== Login button <== ///
  Container loginButton(double width, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.079),
      child: ElevatedButton(
        onPressed: (){
          login();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical:height *0.02),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),

        // height: height * 0.073,

        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  /// <== Header Text <== ///
  Padding headerText(double width, double height) {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05, top: height * 0.079),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Login",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: height * 0.01,
          ),
          const Text("Welcome Back",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  /// <== Logs a user in <== ///
  void login () async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      MyDialogs.showLoadingDialog(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailEditingController.text,
          password: pwdEditingController.text
      );
      var user = await UsersDAO.getUser(credential.user!.uid);
      MyDialogs.dismissDialog(context);
      MyDialogs.showCustomDialog(context,dialogMessage:  "Logged in successfully!", positiveActionName: "Ok", isDismissible: false, positiveAction: () {Navigator.pushReplacementNamed(context, HomeScreen.routeName);});

    } on FirebaseAuthException catch (e) {
      MyDialogs.dismissDialog(context);
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == "INVALID_LOGIN_CREDENTIALS" ) {
        MyDialogs.showCustomDialog(context, isDismissible: true, dialogMessage: "Invalid login credentials.\nPlease, try again.", positiveActionName: "Ok");
      // } else {
      //   MyDialogs.showCustomDialog(context, isDismissible: true, dialogMessage:  "Something went wrong.\nPlease, try again.\nError: ${e.code}", positiveActionName: "Ok");
      }
    }
  }


}
