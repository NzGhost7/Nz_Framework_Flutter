import 'package:flutter/material.dart';
import 'package:project2/models/park.dart';

class AddPark extends StatefulWidget {
  const AddPark({Key? key}) : super(key: key);

  @override
  State<AddPark> createState() => _AddParkState();
}

class _AddParkState extends State<AddPark> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredAddress = '';
  var _enteredDesc = '';
  var _enteredNoPark = 1;

  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(Park(
          id: DateTime.now().toString(),
          name: _enteredName.toString(),
          address: _enteredAddress.toString(),
          desc: _enteredDesc.toString(),
          noOfPark: _enteredNoPark));
      print('Debug _saveData()');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Your Parking Place'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Parking Name',
                          hintText: 'Enter Parking Name',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                      onChanged: (value) {
                        setState(() {
                          _enteredName = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Parking Location',
                          hintText: 'Enter Parking Location',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                      onChanged: (value) {
                        setState(() {
                          _enteredAddress = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Parking Description',
                          hintText: 'Enter Parking Description',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                          onChanged: (value) {
                            setState(() {
                              _enteredDesc = value;
                            });
                          },
                          ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'No. of Parks',
                        hintText: 'Enter No. of Parks',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _enteredNoPark = int.parse(value);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.reset();
                            },
                            child: const Text('Reset')),
                        ElevatedButton(
                          onPressed: _saveData,
                          child: const Text('Submit'),
                        ),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
