import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'Auth.dart';
import 'Blocs/SignInBloc.dart';
import 'Component/BuildSoicalButton.dart';
import 'Component/ClickAbleImage.dart';
import 'Component/RoundedPasswordField.dart';
import 'Component/RoundedTextField.dart';
import 'LoginPage.dart';
import 'constants.dart';


class RegisterPage extends StatefulWidget {
  static Widget create(BuildContext context){
    return Provider<SignInBloc>(
      create:(_) => SignInBloc(),
      child: RegisterPage(),
    );

  }

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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
              RoundedPasswordField(icon:Icons.vpn_key,name: "Confirm Your Password",controller: _confirmPassword,),
              SizedBox(height: 30,),
              ClickAbleImage(name:'asset2',width: 300,press: ()=>signUpWithEmailAndPassword(_email.text,_password.text,_confirmPassword.text),),
            ],
          ),
        ),
      ),
    );
  }

  Future<User> signUpWithEmailAndPassword(String email , String password,String confirmPassword )async{
    try{
      final auth = Provider.of<AuthBase>(context, listen: false);
      if(password == confirmPassword){
        await auth.signUpWithEmailAndPassword(email, password);
        Navigator.of(context).pop();
      }else{
        Fluttertoast.showToast(msg: "Failed !");
      }



    }catch(e){
      print(e.toString());
    }


  }
}
