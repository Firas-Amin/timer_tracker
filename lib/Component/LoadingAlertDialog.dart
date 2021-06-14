import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class LoadingAlertDialog extends StatelessWidget {
  final String message;

  const LoadingAlertDialog({ this.message});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message , style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(),


        ],

      ),
    );
  }
}