import 'package:flutter/material.dart';
import 'package:project1/models/activity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a list of items
  List<Activity> actList = [];

  // Controller for the text input
  TextEditingController todoController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  //Date picker
  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2100))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  //Time Picker
  void _presentTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      setState(() {
        selectedTime = pickedTime;
      });
    });
  }

  // Method to add items to the list
  void addItem() {
    String todo = todoController.text;
    String detail = detailController.text;
    DateTime date = selectedDate;
    TimeOfDay time = selectedTime;
    int latestID = 0;
    latestID++;
    String id = latestID.toString();

    //Activity newAct = Activity(id: id, todo: todo, detail: detail, date: date, time: time);

    if (todo.isNotEmpty) {
      Activity newAct =
          Activity(id: id, todo: todo, detail: detail, date: date, time: time);
      setState(() {
        actList.add(newAct);
        todoController.clear();
        detailController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    actList.sort(
      (a, b) {
        int dateComparison = b.date.compareTo(a.date);
        if (dateComparison != 0) {
          return dateComparison;
        }
        return b.time.hour * 60 +
            b.time.minute -
            (a.time.hour * 60 + a.time.minute);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                  labelText: 'Activity',
                  hintText: 'Enter your activity',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                  labelText: 'Detail',
                  hintText: 'Enter your detail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                        'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}')),
                ElevatedButton(
                    onPressed: _presentDatePicker,
                    child: const Text('Choose Date'))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(child: Text('Date: ${selectedTime.format(context)}')),
                ElevatedButton(
                    onPressed: _presentTimePicker,
                    child: const Text('Choose Date'))
              ],
            ),
            ElevatedButton(
              onPressed: () => addItem(),
              child: const Text('Add New Activity'),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
