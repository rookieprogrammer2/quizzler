import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String text;
  final bool isObscure;
  final IconButton? suffixIcon;
  const MyTextFormField(
      {super.key, required this.text, this.isObscure = false, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.001,
        vertical: height * 0.01,
      ),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.9),
          ),
          border: const UnderlineInputBorder(),
          suffixIcon: suffixIcon,
          labelText: text,
          labelStyle: const TextStyle(
            color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          ),
        ),
      ),
    );
  }
}
