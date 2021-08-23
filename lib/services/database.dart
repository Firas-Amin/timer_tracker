import 'package:flutter/foundation.dart';
import 'package:timer_tracker/services/api_path.dart';

import '../home/models/jobs.dart';
import 'firestore_services.dart';
abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();



}
String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
  final _service =FirestoreService.instance; // constructor
  @override
  Future<void> createJob(Job job) => _service.setData(
    path: APIPath.job(uid, job.id),
    data: job.toMap(),
  );

 Stream<List<Job>> jobsStream() => _service.collectionStream(path: APIPath.jobs(uid),
     builder:(data, documentId) => Job.fromMap(data, documentId));




  }

