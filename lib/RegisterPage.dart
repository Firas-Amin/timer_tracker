
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer_tracker/Auth.dart';

import 'Component/BuildSoicalButton.dart';
import 'Component/ClickAbleImage.dart';
import 'Component/RoundedPasswordField.dart';
import 'Component/RoundedTextField.dart';
import 'LoginPage.dart';
import 'constants.dart';


class RegisterPage extends StatefulWidget {
  final AuthBase auth;
  const RegisterPage({Key key, this.auth}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // prevent the keyboard to overlay the screen.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              SvgPicture.asset('images/timeScreen.svg',width: 200, height: 200,),

              RoundedTextField(icon:Icons.mail,name: "Enter Your Email",controller: _email,),
              RoundedPasswordField(icon:Icons.vpn_key,name: "Must be at least 8 characters",controller: _password,),
              RoundedPasswordField(icon:Icons.vpn_key,name: "Confirm Your Password",),
              SizedBox(height: 40,),
              ClickAbleImage(name:'asset2',width: 300,press: ()=>signUpWithEmailAndPassword(_email.text,_password.text),),
              divider(),
              Text("Sign Up with ", textAlign: TextAlign.center, style: kMainText.copyWith(fontSize: 16),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildSocialButton(asset: "google2",),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<User> signUpWithEmailAndPassword(String email , String password)async{
    try{

      await widget.auth.signUpWithEmailAndPassword(email, password);

      Navigator.of(context).pop();
    }catch(e){
      print(e.toString());
    }


  }
}
