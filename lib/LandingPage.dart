import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/TimeTracker.dart';
import 'package:timer_tracker/database.dart';
import 'Auth.dart';
import 'HomePage.dart';


class LandingPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.authChange(),
      builder: (context, snapshot){// snapshot is an objects that hold the data we will retrieve.
        if(snapshot.data == null){
          return MainScreen();
        }else{
          return Provider<Database>(
            create:(_) => FirestoreDatabase(uid:snapshot.data.uid) ,
              child: HomePage());
        }
      }
    );
  }
}
