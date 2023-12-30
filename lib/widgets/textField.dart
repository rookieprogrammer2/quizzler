import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef Validator = String? Function(String?);

class MyTextFormField extends StatelessWidget {
  final Validator validator;
  final String hintText;
  final bool isObscure;
  final IconButton? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? textEditingController;
  const MyTextFormField(
      {super.key,
      this.textEditingController,
      required this.hintText,
      this.isObscure = false,
      this.suffixIcon,
      required this.keyboardType,
      required this.validator});

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
        style: TextStyle(color: Colors.white.withOpacity(0.8)),
        validator: validator,
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: isObscure,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.5),
          ),
          border: const UnderlineInputBorder(),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
