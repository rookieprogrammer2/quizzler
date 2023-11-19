import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login_sc.dart';
import 'package:quizzler/utilities/fieldValidations.dart';
import 'package:quizzler/widgets/textField.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegistrationScreen extends StatefulWidget {
  static const routeName = "registration_sc";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  // "db" now represents a connection to the database.
  TextEditingController pwdEditingController = TextEditingController();
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
                    padding: EdgeInsets.only(bottom: height * 0.1),
                    //19
                    decoration: const BoxDecoration(
                        color:  Color.fromARGB(255, 71, 212, 76),
                        borderRadius: BorderRadius.all(Radius.circular(200))),
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
                                  labelText: "Username",
                                  keyboardType: TextInputType.text,
                                  validator: (value) => FormValidator.validateUsername(value),
                                ),
                                MyTextFormField(
                                  /// Todo -> add another validation rule that makes sure the E-mail does not already exist.
                                  labelText: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => FormValidator.validateEmail(value)
                                ),
                                MyTextFormField(
                                  validator: (value) => FormValidator.validatePassword(value),
                                  textEditingController: pwdEditingController,
                                  keyboardType: TextInputType.visiblePassword,
                                  labelText: "Password",
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
                                  validator: (value) => FormValidator.validatePasswordConfirmation(value, pwdEditingController.text),
                                  keyboardType: TextInputType.visiblePassword,
                                  labelText: "Confirm Password",
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
          padding: EdgeInsets.symmetric(vertical:height *0.02),
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
          style:TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, LoginScreen.routeName);
          },
          child: const Text(
            "Login ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 17
            ),
          ),
        ),
        const Text(
          "Instead",
          style:TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400
          ),
        ),

      ],
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
