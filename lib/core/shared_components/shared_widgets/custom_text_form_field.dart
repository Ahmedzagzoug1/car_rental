import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool isSecure;
  String? Function(String?)? validator;
  String hintText;
   CustomTextFormField({super.key, required this.hintText,required this.controller,this.isSecure=false,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecure,
      validator:validator,
      decoration:InputDecoration(
        hintText: hintText
      )

      /* const InputDecoration(
        hintText: "Enter your password",
        fillColor: Color(0xFFe5e5e5),
        filled: true,
        hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide.none,
        ),
      ),*/
    );
  }
}
