import 'package:flutter/material.dart';
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
      // appBar: AppBar(
      //   elevation: 3.0,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.centerLeft,
      //             end: Alignment.centerRight,
      //             colors: <Color>[
      //               Color(0xFFCF4241),
      //               Color(0xFFEE5352),
      //               Color(0xFFE14B4C),
      //             ])
      //     ),
      //   ),
      //   title: Center(child: Text("Time Tracker")),
      // ),
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
            ClickAbleImage(name:'asset2',width: 300,press: ()=>print("sign up"),),
            SizedBox(height: 10,),
            Container(
              child: GestureDetector(
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
}



