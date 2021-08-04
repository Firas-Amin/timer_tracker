import 'package:flutter/material.dart';

class BuildSocialButton extends StatelessWidget {
  final Function  onTap;
  final String asset;

  BuildSocialButton({this.onTap, this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              image:AssetImage("images/$asset.jpg"),
            ),

        ),
      ),
    );
  }
}