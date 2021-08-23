import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_tracker/Component/Exception_Alert.dart';
import 'package:timer_tracker/Component/LoadingAlertDialog.dart';
import 'package:timer_tracker/services/database.dart';

import 'models/jobs.dart';



class JobForm extends StatefulWidget {
  const JobForm({Key key, this.database, this.job}) : super(key: key);
  final Database database;
  final Job job;


static Future<void> show(BuildContext context, {Job job}) async {
  final database = Provider.of<Database>(context,listen:false);
  await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> JobForm(database: database,job: job,),fullscreenDialog: true));
}

  @override
  _JobFormState createState() => _JobFormState();
}


class _JobFormState extends State<JobForm> {
  final _formKey = GlobalKey<FormState>();
   String name ;
   int hour;


  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  Future<void> _submit() async{
    if(_validateAndSaveForm()){
      try {
        final jobs = await widget.database.jobsStream().first; // return all the list
        final allNames = jobs.map((job) => job.name).toList();
        if(widget.job != null) {
          allNames.remove(widget.job.name);
        }
        if(allNames.contains(name)){
          showAlertDialog(context: context, title: "Name Already used", content:"Choose a different name", defaultActionText: "Ok");
        }else{
          final id = widget.job?.id ?? documentIdFromCurrentDate();
          final job = Job(name:name,ratePerHour: hour,id: id);
          // await Future.delayed(Duration(seconds: 5));
          await widget.database.createJob(job);
          Navigator.pop(context);
        }

      } on FirebaseException catch(e) {
        showExceptionAlert(context, title: "Operation failed", exception: e);
      }
     
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.job !=null){
      name = widget.job.name;
      hour = widget.job.ratePerHour;
    }
  }


  @override
  Widget build(BuildContext context) {
    final kWhite= TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(widget.job == null ?"New Job":"Edit Job", style: kWhite,)),
        leading:TextButton(onPressed:() => Navigator.pop(context), child:Text("Leave",style:kWhite )),
        actions: [
              TextButton(onPressed:_submit, child:Text("Save",style: kWhite,)),
        ],
      ),
      backgroundColor: Colors.grey[200],

      body: _buildContents(),
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.all(16.0),  
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildForm(),
              ),
            )
          ),
        ),
      ),
    );

  }

 List<Widget> _buildForm() {
    return
      [
      TextFormField(
      decoration: InputDecoration(labelText: "Job Name"),
        initialValue: name,
        validator: (value)=> value.isNotEmpty ? null : "Name Can Not Be Empty",
        onSaved: (value) => name = value,
    ),
      TextFormField(
        decoration: InputDecoration(labelText: "Pay per Hour"),
        initialValue:hour !=null?"$hour":null,
        validator: (value)=> value.isNotEmpty ? null : "Pay Per Hour Can Not Be Empty",
        onSaved: (value) => hour = int.tryParse(value) ?? 0, // if parse return no value the defult value is 0
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
      ),
   ];
  }
}
