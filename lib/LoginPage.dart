import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/Blocs/SignInManager.dart';
import 'package:timer_tracker/Component/Exception_Alert.dart';
import 'Auth.dart';
import 'package:timer_tracker/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Component/ClickAbleImage.dart';
import 'Component/RoundedPasswordField.dart';
import 'Component/RoundedTextField.dart';
import 'Component/BuildSoicalButton.dart';


class LoginPage extends StatelessWidget {
   LoginPage({Key key, this.manager,@required this.isLoading}) : super(key: key);
  final SignInManager manager;
  final bool isLoading;
  static Widget create(BuildContext context){
    final auth = Provider.of<AuthBase>(context,listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_)=> ValueNotifier<bool>(false),

      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __)=> Provider<SignInManager>(
          create:(_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager,__) => LoginPage(manager: manager,isLoading: isLoading.value,)
          ),
        ),
      ),
    );

  }


  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildContext(context),
        
    );
  }

  Widget buildContext(BuildContext context){
    return SingleChildScrollView(
      child: SafeArea(
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
              ),
              RoundedPasswordField(
                icon:Icons.lock,
                name: "Enter Your Password",
                controller: _password,
                focusNode: _passwordFocusNode,
              ),
              Text("Forget Password?", textAlign: TextAlign.end, style: kMainText.copyWith(fontSize: 16),),
              SizedBox(height: 30,),

              ClickAbleImage(name:'asset1',width: 300,press: ()=>
              _email.text.isEmpty || _password.text.isEmpty ?  Fluttertoast.showToast(msg: "Fill all the fields") :
              isLoading ? print("loading") : signInWithEmailAndPassword(_email.text,_password.text,context),
              ),
              divider(),
              Text("Sign In with ", textAlign: TextAlign.center, style: kMainText.copyWith(fontSize: 16),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildSocialButton(asset: "google2",onTap:() =>  _signInWithGoogle(context),
                   ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }








  Future<void> _signInWithGoogle(BuildContext context) async {

    try{
      await manager.signInGoogle();
      Navigator.of(context).pop();

    }on FirebaseAuthException catch(e){
      if(e.code == "ERROR_ABORTED_BY_USER"){
        return;
      }else{
        showExceptionAlert(context, title: "Failed To LoginIn", exception: e);
      }

    }
  }
  Future<User>signInWithEmailAndPassword(String email , String password,BuildContext context) async {
    try{
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithEmailAndPassword(email, password);
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context).pop();
    }on FirebaseAuthException catch(e){
     showExceptionAlert(context, title: "Failed To LoginIn", exception: e);
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

