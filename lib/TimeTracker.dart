import 'package:flutter/material.dart';
import 'Component/component.dart';

class TimeTracker extends StatelessWidget {
  const TimeTracker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3447B1) ,
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
        shape: CustomShapeBorder(),
        title: Center(child: Text("Time Tracker")),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

