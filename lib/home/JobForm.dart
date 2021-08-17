import 'package:flutter/material.dart';



class JobForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:() => Navigator.pop(context), child:Text("Leave")),
          TextButton(onPressed:() =>print("save"), child:Text("Save")),
        ],
      ),
    );
  }
}
