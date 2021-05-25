import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer_tracker/constants.dart';

import 'Component/ClickAbleImage.dart';
import 'Component/RoundedPasswordField.dart';
import 'Component/RoundedTextField.dart';
import 'Component/BuildSoicalButton.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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

              SvgPicture.asset('images/timeScreen.svg',width: 200, height: 200,),

              Text("Email:", style: kMainText.copyWith(fontSize: 16),),
              RoundedTextField(icon:Icons.mail,name: "Enter A Valid Email",),


              Text("Password:", style: kMainText.copyWith(fontSize: 16),),
              RoundedPasswordField(icon:Icons.lock,name: "Must be at least 8 characters",),
              Text("Forget Password?", textAlign: TextAlign.end, style: kMainText.copyWith(fontSize: 16),),


              SizedBox(height: 10,),
              ClickAbleImage(name:'asset1',width: 300,press: ()=>Navigator.push(context, MaterialPageRoute(builder:(c)=> LoginPage())),),
              _divider(),
              Text("Sign In with ", textAlign: TextAlign.center, style: kMainText.copyWith(fontSize: 16),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildSocialButton(asset: "facebook",),
                 BuildSocialButton(asset: "google2",),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}




Widget _divider() {
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

