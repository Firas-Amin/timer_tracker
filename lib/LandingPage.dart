import 'package:flutter/material.dart';
import 'package:timer_tracker/TimeTracker.dart';
import 'Auth.dart';
import 'HomePage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key, this.auth}) : super(key: key);
  final AuthBase auth;








  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authChange(),
      builder: (context, snapshot){// snapshot is an objects that hold the data we will retrieve.
      if(snapshot.connectionState == ConnectionState.active){
        if(snapshot.data == null){
          return MainScreen(auth:auth,);
        }else{
          return HomePage(auth:auth,);
        }
      }else {
        return Scaffold(
          body: Container(
            child: CircularProgressIndicator(

            ),
          ),
        );

      }

      }

    );
  }
}
