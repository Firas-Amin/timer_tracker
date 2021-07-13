import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timer_tracker/Component/LoadingAlertDialog.dart';

Future<void> showExceptionAlert(BuildContext context,
{
  @required String title,
  @required Exception exception,

}){
  return showAlertDialog
    (context: context, title: title, content: _message(exception), defaultActionText:"OK");
}

String _message(Exception exception){
if(exception is FirebaseException){
  return exception.message;
}else{
  return exception.toString();
}
}