import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ClickAbleImage extends StatelessWidget {
  final Function press;
  final String name;
  final double width;
  const ClickAbleImage({
    Key key, this.press,@required this.name, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:press,
        child: SvgPicture.asset('images/$name.svg',width: width,));
  }
}