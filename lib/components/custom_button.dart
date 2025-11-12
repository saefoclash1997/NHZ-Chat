
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
 final void Function()? onPressed;
  const CustomButton({
    super.key, required  this.title, this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: title =="Sign In"?  kLightGradient : kDarkGradient
      ),
      child: MaterialButton(onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 28
          ),),

      ),
    );
  }
}
