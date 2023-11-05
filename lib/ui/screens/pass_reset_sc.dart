import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/register_sc.dart';
import 'package:quizzler/widgets/textField.dart';

import 'login_sc.dart';

class PasswordReset extends StatelessWidget {
  static const String routeName = "pass_reset_sc";
  const PasswordReset({super.key});

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
                        color: Color.fromARGB(255, 71, 212, 76),
                        borderRadius: BorderRadius.all(Radius.circular(200))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.15, vertical: height * 0.05),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: height * 0.085),
                          const Column(
                            children: <Widget>[
                              MyTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                text: "New Password",
                                isObscure: true,
                                suffixIcon: IconButton(
                                  onPressed: null, /// TODO remove the const keyword from the column when you add functionality
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              MyTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                text: "Confirm New Password",
                                isObscure: true,
                                suffixIcon: IconButton(
                                  onPressed: null, /// TODO remove the const keyword from the column when you add functionality
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.077),
                          loginButton(width, height),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Password",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: height * 0.01,
          ),
          const Text("Reset",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600)),
        ],
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

  Container loginButton(double width, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.079),
      child: ElevatedButton(
        onPressed: () {},
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
            "Update Password",
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


}
