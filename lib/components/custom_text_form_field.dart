import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.validator
  });
  String? Function(String?)? validator;
  final TextEditingController controller;
  final String title;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      obscureText: widget.title == "Email" ? false : hidePassword,
      keyboardType: widget.title == "Email"
          ? TextInputType.emailAddress
          : TextInputType.name,
      controller: widget.controller,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        suffixIcon: widget.title == "Email"
            ? null
            : IconButton(
                icon: Icon(
                  hidePassword ? Icons.visibility : Icons.visibility_off,

                  color: kDarkBlue1,
                ),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 2, color: kLightBlue2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 3, color: kDarkBlue2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 3, color: Colors.red),
        ),
        label: Text(widget.title),

        labelStyle: TextStyle(color: kDarkBlue1),
      ),
    );
  }
}
