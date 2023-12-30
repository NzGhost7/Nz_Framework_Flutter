import 'package:flutter/material.dart';
import 'package:test_app/add_activity.dart';
import 'package:test_app/models/activity.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({super.key});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  List<Activity> actList = [];
  void _addAct() async {
    await Navigator.of(context).push<ActivityList>(
        MaterialPageRoute(builder: (context) => AddActivity()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity List'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: actList.length,
          itemBuilder: (context, index) {
            final act = actList[index];
            return ListTile(
              leading: Text("${act.date.day}/${act.date.month}"),
              title: Text(act.todo),
              subtitle: Text(act.detail),
              trailing: Text(act.time.format(context)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
