import 'package:flutter/material.dart';
import 'package:timer_tracker/constants.dart';
class RoundedButton extends StatelessWidget {
  final Size size;
  final String text;
  final Function press;
  RoundedButton({this.text, this.size, this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: size.width * 0.8,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          onPressed: press,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kWhite, kRed],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Bristone',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                  letterSpacing: 2.7724639892578127,
                  height: 1.2000000550369243,
                ),
              ),
            ),
          ),
        // padding: ,
      ),
    );
  }
}
