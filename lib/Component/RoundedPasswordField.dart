import 'package:flutter/material.dart';
import 'package:timer_tracker/Component/RoundedTextField.dart';

import '../constants.dart';

class RoundedPasswordField extends RoundedTextField {
  RoundedPasswordField({
String name,
    IconData icon,
    TextEditingController controller,
    FocusNode focusNode,
}): super(controller: controller, icon: icon,name: name , focusNode: focusNode);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: true,
        textInputAction: TextInputAction.done,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: name,
          hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
          ),
          icon: Icon(
            icon,
            color: kRed,
          ),
          border: InputBorder.none,
          suffixIcon: icon2,
        ),
      ),
    );
  }
}
