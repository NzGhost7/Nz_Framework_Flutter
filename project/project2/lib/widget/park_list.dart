import 'package:flutter/material.dart';
import 'package:project2/models/park.dart';
import 'package:project2/widget/add_park.dart';

class ParkList extends StatefulWidget {
  const ParkList({super.key});

  @override
  State<ParkList> createState() => _ParkListState();
}

class _ParkListState extends State<ParkList> {
  List<Park> _park = [];

  void _loadData() { 
  }

  //add parking data
  void _addData() async {
    final data = await Navigator.of(context).push<Park>(MaterialPageRoute(
      builder: (context) => const AddPark(),
    ));

    if (data!= null) {
      setState(() {
        _park.add(data);
      });
    }
  }

  //delete the parking data
  void _removeData(Park data) {
    setState(() {
      _park.remove(data);
    });
  }

  // ParkList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Park List'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _park.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(_park[index].name),
                      subtitle: Text(_park[index].address),
                      trailing: Icon(Icons.delete));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addData(),
          child: Icon(Icons.add),
        ));
  }
}
