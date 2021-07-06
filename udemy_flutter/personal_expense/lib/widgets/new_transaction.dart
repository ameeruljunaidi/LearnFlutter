import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx) {
    // print('Constructor NewTransaction Widget');
  }

  final dynamic addTx;

  @override
  _NewTransactionState createState() {
    // print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  _NewTransactionState() {
    // print('Constructor New Transaction State');
  }

  @override
  void initState() {
    // print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // print('dispose()');
    super.dispose();
  }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final _enteredTitle = _titleController.text;
    final _enteredAmount = double.parse(_amountController.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      _enteredTitle,
      _enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  children: <Widget>[
                    // ignore: unnecessary_null_comparison
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColorDark),
                      onPressed: _presentDatePicker,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                style: TextButton.styleFrom(
                  primary: Theme.of(context).textTheme.button!.color,
                ),
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
