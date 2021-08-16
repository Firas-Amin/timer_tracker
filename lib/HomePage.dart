import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/Component/LoadingAlertDialog.dart';

import 'Auth.dart';



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
        actions: [
          TextButton(onPressed:()=>confirmSignOut(context), child: Text("SIGN OUT",style: TextStyle(color: Colors.white),),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _createJob,
      ),
    );
  }
  void _createJob() {
  }




   Future<void >confirmSignOut(BuildContext context) async{
    final isSignOut = await showAlertDialog(title:"Signing Out",
    content: "Are you sure you want to sign out?",
    context: context,
    cancelActionText: "cancel",
    defaultActionText: 'Logout'
    );
    if(isSignOut == true){
      signOut(context);
    }

  }
  void signOut(BuildContext context)async{
    final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();

  }


}
