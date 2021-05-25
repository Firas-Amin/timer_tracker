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
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xFFCF4241),
                  Color(0xFFEE5352),
                  Color(0xFFE14B4C),
                ]),

        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final IconData icon;
  final String name;
  final Widget icon2;
  final ValueChanged<String> onChanged;
  const RoundedTextField({this.icon, this.name, this.onChanged, this.icon2});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: name,
          hintStyle: TextStyle(
          color: Colors.white,
            fontSize: 14.0
        ),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          suffixIcon: icon2,
        ),
      ),
    );
  }
}