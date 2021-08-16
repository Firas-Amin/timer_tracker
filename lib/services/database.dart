import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:timer_tracker/services/api_path.dart';

import '../home/models/jobs.dart';
abstract class Database {
  Future<void> createJob(Job job);



}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  @override
  Future<void> createJob(Job job) => _setData(
    path: APIPath.job(uid, 'job_abc'),
    data: job.toMap(),
  );
  Future<void>_setData({String path, Map<String, dynamic> data}) async{
    final reference = FirebaseFirestore.instance.doc(path);
    print("$path: $data");
    await reference.set(data);
  }


}