import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Auth.dart';
class HomePage extends StatelessWidget {
  final VoidCallback onSignOut;
  final AuthBase auth;

  const HomePage({Key key, this.onSignOut,@required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
        actions: [
          TextButton(onPressed:signOut, child: Text("SIGN OUT",style: TextStyle(color: Colors.white),),)
        ],
      ),
    );
  }

  void signOut()async{
    await auth.signOut();
    onSignOut();

  }
}
