import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  late final Function addTrx;

  NewTransaction(this.addTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //Define the variable for handling changes to a TextField....
  final titleController = TextEditingController();
  final amountController = TextEditingController(); 
  late DateTime _selectedDate = DateTime.now();

  // Add method function submitData
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    //Check if the enteredTitle and enteredAmount is empty
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print('Please enter the title and amount');
      return;
    }

    //To access the addTrx function from user_transaction.dart
    widget.addTrx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    //To close the bottom sheet after user click the button
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('#Debug: test Choose Date');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => { titleInput = val},   // Note: 1st approach
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => { amountInput = val},
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      // ignore: unnecessary_null_comparison
                      _selectedDate == null
                        ? 'No date choosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'
                    ),
                  ),
                  TextButton(onPressed: _presentDatePicker, child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.grey,
                // foregroundColor: Colors.black,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                print(titleController);
                print(amountController);
                submitData();
                // addTrx(
                //   titleController.text,
                //   double.parse(amountController.text),
                // );
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}