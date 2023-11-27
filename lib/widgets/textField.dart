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
        style: const TextStyle(color: Colors.white),
        validator: validator,
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: isObscure,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.9),
          ),
          border: const UnderlineInputBorder(),
          suffixIcon: isObscure
              ? IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                  ),
                )
              : IconButton(
                  onPressed: null,
                  icon: SvgPicture.asset(
                    "assets/icons/visibility_off.svg",
                    color: Colors.white,
                    width: width * 0.06,
                  )),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
