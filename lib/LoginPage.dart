
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Auth.dart';
import 'package:timer_tracker/constants.dart';


import 'Component/ClickAbleImage.dart';
import 'Component/LoadingAlertDialog.dart';
import 'Component/RoundedPasswordField.dart';
import 'Component/RoundedTextField.dart';
import 'Component/BuildSoicalButton.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              SvgPicture.asset('images/timeScreen.svg',width: 200, height: 200,),
              RoundedTextField(icon:Icons.mail,name: "Enter Your Email",
              controller: _email,
                focusNode: _emailFocusNode,
                function: _onCompleteNode,
              ),

              RoundedPasswordField(
                icon:Icons.lock,
                name: "Must be at least 8 characters",
                controller: _password,
              focusNode: _passwordFocusNode,
              ),
              Text("Forget Password?", textAlign: TextAlign.end, style: kMainText.copyWith(fontSize: 16),),
              SizedBox(height: 30,),

              ClickAbleImage(name:'asset1',width: 300,press: ()=>signInWithEmailAndPassword(_email.text,_password.text),),
              divider(),
              Text("Sign In with ", textAlign: TextAlign.center, style: kMainText.copyWith(fontSize: 16),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 BuildSocialButton(asset: "google2",onTap: _SignInWithGoogle,),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
  void _onCompleteNode(){
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  Future<void> _SignInWithGoogle() async {
    try{
      await widget.auth.signInGoogle();
      Navigator.of(context).pop();

    }catch(e){
      print(e.toString());
    }
  }
  Future<User>signInWithEmailAndPassword(String email , String password) async {
    showDialog(context: context,
        builder: (c) {
          return LoadingAlertDialog(message:"Authenticating please wait...",);
        });
    try{
      await Future.delayed(Duration(seconds: 2));
      await widget.auth.signInWithEmailAndPassword(email, password);
      Navigator.of(context).pop();
    }catch(e){
      print(e.toString());
    }
  }
}



Widget divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}

