import 'package:flutter/material.dart';
import 'package:quizzler/ui/screens/login/login_sc.dart';
import 'package:quizzler/utilities/app_assets.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = "landing_screen";

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 254),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
                "${AppAssets.imagesPath}student_illustration.jpg"), // Replace with your illustration asset
          ),
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: Text(
              "Easy quiz creation",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: Text(
              "Create simple T/F & MCQ quizzes with an easy-to-use interface. "
              "Share them with your students and get detailed feedback on their performance",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: const Text(
                "Start Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
