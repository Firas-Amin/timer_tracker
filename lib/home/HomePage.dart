import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/Component/Exception_Alert.dart';
import 'package:timer_tracker/Component/LoadingAlertDialog.dart';
import 'package:timer_tracker/home/JobForm.dart';


import '../services/Auth.dart';
import '../services/database.dart';
import 'models/jobs.dart';



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
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=> JobForm.show(context),
      ),
    );
  }




  Widget _buildContents(BuildContext context){
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder(
      stream: database.jobsStream(),
      builder: (context,snapshot){
       if(snapshot.hasData) {
         final jobs = snapshot.data;
         final children = jobs.map<Widget>((job) => Text(job.name)).toList();
         return ListView(children:children,);
       } else {
         if(snapshot.hasError) {
           return Center(child: Text("An error occurred"),);
         }
         return Center(child: CircularProgressIndicator(),);
       }
      },
    );
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
