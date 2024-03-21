import 'dart:developer';

import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

    final _titleController = TextEditingController();


/// if you used controller so you have to use dispose, why? 
/// cuz controller is still runing and working even if you closed the page or the widget,
/// so we have to stop him we have to destroy him, how?      
/// by using dispose

    @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
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
    return  Padding(
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
              ElevatedButton(onPressed: (){
                log(_titleController.text);
              }, child: const Text("Save Expense"),)
            ],
          ),
        ],
      ),
    );
  }
}
