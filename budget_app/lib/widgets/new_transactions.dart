import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import './title_heading.dart';

class NewTransaction extends StatefulWidget {
  final Function addTranx;

  NewTransaction(this.addTranx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  DateTime selectedDate;

  void submitData() {
    if (titleInputController.text == null ||
        amountInputController.text == null ||
        selectedDate == null) {
      return;
    }

    widget.addTranx(titleInputController.text,
        double.parse(amountInputController.text), selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10
        ),
        child: Column(
          children: <Widget>[
            const TitleHeading('Add new expense'),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: titleInputController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Amount',
                filled: true,
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none),
              ),
              controller: amountInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => {submitData()},
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    selectedDate == null
                        ? 'No date chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(selectedDate)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                    color: Colors.indigoAccent,
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Choose date',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                color: Colors.indigoAccent,
                onPressed: submitData),
          ],
        ),
      ),
    );
  }
}
