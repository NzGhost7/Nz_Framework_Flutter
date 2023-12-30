import 'package:flutter/material.dart';
import 'package:project2/models/park.dart';

class AllParkList extends StatefulWidget {
  const AllParkList({super.key});

  @override
  State<AllParkList> createState() => _AllParkListState();
}

class _AllParkListState extends State<AllParkList> {
  final List<Park> _park = [];

  //load data from database and put into the _park array
  void _loadData() async {}

  void _showData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Find Parking'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: 'Option 1',
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(child: Text('Option 1'), value: 'Option 1'),
                DropdownMenuItem(child: Text('Option 2'), value: 'Option 2'),
                DropdownMenuItem(child: Text('Option 3'), value: 'Option 3'),
              ],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              onChanged: (String? value) {
                print(value);
              },
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Search'),
            ),
            Card(
                //show all data here
                )
          ],
        ),
      ),
    );
  }
}
