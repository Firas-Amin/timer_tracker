import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  TextFieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      child: child,
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
            color: Color(0xffE5E5E5),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final IconData icon;
  final String name;
  final Widget icon2;
  final TextEditingController controller;
  const RoundedTextField({this.icon, this.name, this.controller, this.icon2});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
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
          suffixIcon: icon2,
          border: InputBorder.none,
        ),
      ),
    );
  }
}