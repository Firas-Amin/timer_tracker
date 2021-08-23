
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/jobs.dart';

class JobListTitle extends StatelessWidget {
  final Job job;
  final VoidCallback onTap;
  const JobListTitle({Key key, this.job, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(job.name),
      onTap: onTap,
      trailing: Icon(Icons.chevron_right),
    );
  }
}
