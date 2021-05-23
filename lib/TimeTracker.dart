import 'package:flutter/material.dart';
import 'package:timer_tracker/constants.dart';
import 'Component/component.dart';
import 'Component/costumButton.dart';

class TimeTracker extends StatelessWidget {
  const TimeTracker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF30475e) ,
      ),
      home: MainScreen(),
    );
  }
}



class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        shape: CustomShapeBorder(),
        title: Center(child: Text("Time Tracker")),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kRed,
                kDarkBlue,

              ],
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to TimeTracker !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily:'Pattaya',
                  fontSize: 26.0,
                  color: kWhite,
                ),
              ),
              Image.asset("images/time.png", height: 100, width: 100,),
              RoundedButton(text: 'Sign In !',),
              RoundedButton(text: 'Sign Up !',),

              Container(
                child: GestureDetector(
                  child: Text(
                    ' - Sign In as Anonymously -',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: kWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

