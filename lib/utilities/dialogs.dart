import 'package:flutter/material.dart';

class MyDialogs {

  // static: Class level. Belongs to the class.
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      /// Todo: change "barrierDismissible" value to false after you finish working on the auth part.
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              const Text("Loading..."),
            ],
          ),
        );
      },
    );
  }

  static void dismissDialog (BuildContext context) {
    Navigator.pop(context);
  }

  static void showCustomDialog(BuildContext context, {
        required String dialogMessage,
        required bool isDismissible,
        String? positiveActionName,
        String? negativeActionName,
        VoidCallback? positiveAction,
        VoidCallback? negativeAction
      }) {
    List<Widget> actions = [];
    if(positiveActionName != null) {
      actions.add(
          TextButton(
              onPressed: (){
                Navigator.pop(context);
                positiveAction?.call();
              },
              child: Text(positiveActionName),
          ),
      );
    }
    if(negativeActionName != null) {
      actions.add(
          TextButton(
              onPressed: (){
                Navigator.pop(context);
                negativeAction?.call();
              },
              child: Text(negativeActionName),
          ),
      );
    }

    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: actions,
          content: Row(
            children: [
              Expanded(child: Text(dialogMessage)),
            ],
          ),
        );
      },
    );
  }
}
