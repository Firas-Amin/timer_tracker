import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timer_tracker/TimeTracker.dart';

import 'HomePage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  User _user ;

  void _updateUser(User user){
    setState(() {
      _user =user;
      print(_user);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null ?  MainScreen(isSignedIn: _updateUser,) :  HomePage(),
    );
  }
}
