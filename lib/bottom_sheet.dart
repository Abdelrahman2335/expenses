import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expense.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});

  final void Function(Expense value) onAddExpense;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime?
      _selectedDate; // we have to make the type DateTime? cuz pickedDate is the same type

  final formatter = DateFormat.yMd();
  Category _selectedCategory = Category.food;

  /// if you used controller so you have to use dispose, why?
  /// cuz controller is still running and working even if you closed the page or the widget,
  /// so we have to stop him we have to destroy him, how?
  /// by using dispose

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

// this is the first way =>

  // var _userTitle = "";

  // void _saveTitle(String userInput) {
  //   setState(() {
  //     _userTitle = userInput;
  //    log(_userTitle);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: (value) => _saveTitle, // this is one way how you can save the user input and you have other way using controller
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType
                      .number, // this will show you the type of the keyboard that you want.
                  // onChanged: (value) => _saveTitle, // this is one way how you can save the user input and you have other way using controller
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText:
                        "\$", // The prefix is simply putting some strings or icon's after or before the text
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "Select Date"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final startTime = DateTime(now.year -
                            20); // note this DateTime we have to use it cuz if not the type of the startTime will be int not dateTime.
                        final picekDate = await showDatePicker(
                            context: context,
                            firstDate: startTime,
                            lastDate:
                                now); /*.then((value) => log(value.toString()));*/ // Look... now we are dealing with future so we can say in the future when the user give us date (then) do as follow...
                        setState(() {
                          _selectedDate = picekDate;
                        });
                        //please note that value is the date that the user choose.
                        //There is another way by using async and await
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              DropdownButton(
                value:
                    _selectedCategory, // we have to use value here so we can show the user what s/he have selected on the screen.
                items: Category.values
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(e.name.toUpperCase())))
                    .toList(),
                onChanged: (newVal) {
                  if (newVal == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = newVal;
                  });
                },
              ), //name is the name of enum value. Don't forget we did all of this because DropdownButton is (required List of DropdownMenuItem)
              const Spacer(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(_amountController.text);

                  /// here  we are using tryParse cus we are not sure if the user is entering int only
                  /// and the type of enteredAmount is double? cuz this is the type of tryParse.
                  final bool amountIsInvalid =
                      enteredAmount == null || enteredAmount <= 0;

                  // const snackBar = SnackBar(content: Text("Error"));

                  if (_titleController.text.trim().isEmpty ||
                      amountIsInvalid ||
                      _selectedDate == null) {
                    showDialog(
                        context: context,
                        builder: (stx) => AlertDialog(
                              title: const Text("Invalid data"),
                              content: const Text(
                                  "Please enter the title, amount, date and category corectly!"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(
                                        stx) /*note that we can't use context like this cuz this is for the main build but we can use stx as it's the context that we want */,
                                    child: const Text("Okay"))
                              ],
                            ));

                    ///read more about trim()
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar); /// this is not the best way to show an error cuz this will not be shown on the top of the bottom_sheet
                  } else {
                    widget.onAddExpense(Expense(
                      category: _selectedCategory,
                      title: _titleController.text,
                      date: _selectedDate!,
                      amount: enteredAmount,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
