import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timer_tracker/LandingPage.dart';
import 'package:timer_tracker/RegisterPage.dart';
import 'Auth.dart';
import 'Component/ClickAbleImage.dart';
import 'LoginPage.dart';
import 'constants.dart';


class TimeTracker extends StatelessWidget {
  const TimeTracker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
      ),
      home: LandingPage(),
    );
  }
}



class MainScreen extends StatelessWidget {
  const MainScreen({Key key, this.isSignedIn, this.auth}) : super(key: key);
  final void Function(User) isSignedIn;
  final AuthBase auth ;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClickAbleImage(name:'time',),
            SizedBox(height: 100,),
            ClickAbleImage(name:'asset1',width: 300,press: ()=>Navigator.push(context, MaterialPageRoute(builder:(c)=> LoginPage())),),
            SizedBox(height: 10,),
            ClickAbleImage(name:'asset2',width: 300,press: ()=>Navigator.push(context, MaterialPageRoute(builder:(c)=>RegisterPage())),),
            SizedBox(height: 10,),
            Container(
              child: GestureDetector(
                onTap: _SignInAnonymous,
                child: Text(
                  "Sign In as Anonymously",
                  textAlign: TextAlign.center,
                  style:kMainText
                ),
            ),
              ),
          ],
        ),
      ),
    );
  }
  Future<void> _SignInAnonymous() async {
    try{
      final user= await auth.signInAnonymously();
      isSignedIn(user);
    }catch(e){
      print(e.toString());

    }


  }
}



