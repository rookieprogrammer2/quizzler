import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/user_provider.dart';
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

  bool _obscureText = true;
  bool _obscureTextTwo = true;
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
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
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
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: height * 0.085),
                        Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(8.0),
                                child: const Row(
                                  children: [
                                    Text("Role"),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_down_rounded),
                                  ],
                                ),
                              ),
                              MyTextFormField(
                                context: context,
                                /// Todo -> add another validation rule that makes sure the Username does not already exist.
                                textFieldIcon: Icon(
                                    Icons.person_outline_rounded,
                                    color: Colors.white.withOpacity(0.8)),
                                hintText: "Username",
                                onChanged: (value) {
                                  if (value.length >= 3) {
                                    userNameEditingController.clearComposing();
                                    setState(() {});
                                  }
                                },
                                textEditingController:
                                    userNameEditingController,
                                keyboardType: TextInputType.text,
                                validator: (value) =>
                                    FormValidator.validateUsername(value),
                              ),
                              MyTextFormField(
                                  context: context,
                                  /// Todo -> add another validation rule that makes sure the E-mail does not already exist.
                                  hintText: "Email",
                                  textFieldIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.white.withOpacity(0.8),
                                  ),
                                  textEditingController: emailEditingController,
                                  onChanged: (value) {
                                    if (FormValidator.validateEmail(value) == null) {
                                      emailEditingController.clearComposing();
                                      setState(() {});
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => FormValidator.validateEmail(value)
                              ),
                              MyTextFormField(
                                context: context,
                                textFieldIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                validator: (value) =>
                                    FormValidator.validatePassword(value),
                                textEditingController: pwdEditingController,
                                onChanged: (value) {
                                  if (FormValidator.validatePassword(value) == null) {
                                    pwdEditingController.clearComposing();
                                    setState(() {});
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                hintText: "Password",
                                isObscure: _obscureText,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _obscureText = !_obscureText;
                                    print("ICON CLICKED!");
                                    setState(() {});
                                  },
                                  icon: _obscureText
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                          size: 18,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                ),
                              ),
                              MyTextFormField(
                                context: context,
                                textFieldIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                validator: (value) =>
                                    FormValidator.validatePasswordConfirmation(
                                        value, pwdEditingController.text),
                                keyboardType: TextInputType.visiblePassword,
                                hintText: "Confirm Password",
                                isObscure: _obscureTextTwo,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _obscureTextTwo = !_obscureTextTwo;
                                    print("ICON CLICKED!");
                                    setState(() {});
                                  },
                                  icon: _obscureTextTwo
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                          size: 18,
                                        )
                                      : const Icon(
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
    );
  }

  /// => Header Text <== ///
  Padding headerText(double width, double height) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, top: height * 0.079),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Register",
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// => Create Account Button <== ///
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
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  /// => Clickable Login Text <== ///
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
    var authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      MyDialogs.showLoadingDialog(context);
      await authProvider.register(emailEditingController.text,
          pwdEditingController.text, userNameEditingController.text);

      MyDialogs.dismissDialog(context);
      MyDialogs.showCustomDialog(context,
          dialogMessage: "Account created successfully!",
          isDismissible: true,
          positiveActionName: "Ok", positiveAction: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        MyDialogs.showCustomDialog(context,
            dialogMessage: "This email is already in use.",
            isDismissible: true,
            positiveActionName: "Ok", positiveAction: () {
          Navigator.pop(context);
        });
      } else {
        MyDialogs.showCustomDialog(context,
            dialogMessage: "Error: ${e.code}",
            isDismissible: true,
            positiveActionName: "Ok", positiveAction: () {
          Navigator.pop(context);
        });
      }
    }
  }

  void checkCurrAuthState() {
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
