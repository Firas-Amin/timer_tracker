import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/LandingPage.dart';
import 'package:timer_tracker/RegisterPage.dart';
import 'services/Auth.dart';
import 'Blocs/SignInManager.dart';
import 'Component/ClickAbleImage.dart';
import 'Component/Exception_Alert.dart';
import 'LoginPage.dart';
import 'constants.dart';


class TimeTracker extends StatelessWidget {
  const TimeTracker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create:(context)=> Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
        ),
        home: LandingPage(),
      ),
    );
  }
}



class MainScreen extends StatefulWidget {
  

  @override
  _MainScreenState createState() => _MainScreenState();
}
bool _isLoading = false;


class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isLoading=false;
  }


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
            ClickAbleImage(name:'asset1',width: 300,press: ()=>_isLoading ? null :Navigator.push(context, MaterialPageRoute(fullscreenDialog:true,builder:(c)=> LoginPage.create(context))),),
            SizedBox(height: 10,),
            ClickAbleImage(name:'asset2',width: 300,press: ()=>_isLoading ? null :Navigator.push(context, MaterialPageRoute(builder:(c)=>RegisterPage.create(context))),),
            SizedBox(height: 10,),
            Container(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _isLoading = true;
                    buildMethod();
                  });

                },
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
      final auth = Provider.of<AuthBase>(context, listen: false);
      await Future.delayed(Duration(seconds: 5));
    await auth.signInAnonymously();
    setState(() {
      _isLoading = false;
    });

    }on FirebaseAuthException catch(e){
      showExceptionAlert(context, title: "Failed To LoginIn", exception: e);
    }finally{
      Navigator.pop(context);
      setState(() {
        _isLoading = false;
      });
    }
  }
  Widget buildMethod(){
    if(_isLoading == true){
      _SignInAnonymous();
      showDialog(context: context, builder:(BuildContext context){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Authenticating please wait..." , style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(),
            ],
          ),
        );
      });
    }
  }
}



