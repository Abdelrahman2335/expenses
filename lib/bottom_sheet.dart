import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expense.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate; // we have to make the type DateTime? cuz pickedDate is the same type

  final formatter = DateFormat.yMd();
  Category _selectedCategory = Category.travel;

  /// if you used controller so you have to use dispose, why?
  /// cuz controller is still runing and working even if you closed the page or the widget,
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
                        "\$", // The prefix is simply puting some strings or icon's after or before the text
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "Selcete Date"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final startTime = DateTime(now.year -
                            20); // note this DateTime we have to use it cuz if not the type of the startTime will be int not dateTime.
                        final pickeDate = await showDatePicker(
                            context: context,
                            firstDate: startTime,
                            lastDate:
                                now); /*.then((value) => log(value.toString()));*/ // Look... now we are dealing with futher so we can say in the futher when the user give us date (then) do as follow...
                        setState(() {
                          _selectedDate = pickeDate;
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
                value: _selectedCategory, // we have to use value here so we can show the user what s/he have selected on the screen.
                items: Category.values
                    .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name.toUpperCase())
                      )
                      )
                    .toList(),
                onChanged: (newVal) {
                  if (newVal == null){
                    return;
                  }
                  setState(() {
                    _selectedCategory = newVal;
                  });
                },
              ), //name is the name of enum value. Don't forget we did all of this because DropdownButton is (required List of DropdownMenuItem)
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  log(_titleController.text);
                  log(_amountController.text);
                },
                child: const Text("Save Expense"),
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
