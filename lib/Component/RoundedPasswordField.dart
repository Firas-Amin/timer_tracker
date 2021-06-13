import 'package:flutter/material.dart';
import 'package:timer_tracker/Component/RoundedTextField.dart';

import '../constants.dart';

class RoundedPasswordField extends RoundedTextField {

  RoundedPasswordField({
String name,
    IconData icon,
    TextEditingController controller,
}): super(controller: controller, icon: icon,name: name);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: true,
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
