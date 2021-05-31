import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: _user == null ?  MainScreen(isSignedIn: _updateUser,) :  HomePage(onSignOut: ()=>_updateUser(null),),
    );
  }
}
