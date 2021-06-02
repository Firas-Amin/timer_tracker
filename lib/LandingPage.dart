import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timer_tracker/LoginPage.dart';
import 'package:timer_tracker/TimeTracker.dart';

import 'Auth.dart';
import 'HomePage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key, this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  User _user ;
  @override
  void initState() {
    widget.auth.authChange().listen((_user) {
      print('UID :${_user?.uid}'); // the question mark to prevent to return null ;

    });

    super.initState();
    _updateUser(widget.auth.currentUser); // when the application starts we will receive the current user;
  }

  void _updateUser(User user){
    setState(() {
      _user =user;

    });

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.auth.authChange(),
      builder: (context, snapshot){// snapshot is an objects that hold the data we will retrieve.
      if(snapshot.hasData){
        return HomePage(auth: widget.auth,);
      }else {
        return MainScreen(auth:widget.auth,);
      }

      }

    );
  }
}
