import 'package:flutter/material.dart';

import '../../controller/maincontroller.dart';


class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog(
      {super.key,
        required this.categoryController,
        required this.catController,
        required this.fetchdata});

  final TextEditingController categoryController;
  final CategoryController catController;
  final void Function() fetchdata;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add category"),
      content: TextField(
        controller: categoryController,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: "Category",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.blueGrey, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.blueGrey,
              )),
          isDense: false,
          // Added this
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
      actions: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(Colors.blueGrey)),
            onPressed: () {
              categoryController.clear();
              Navigator.pop(context);
            },
            child: const Text("Close"),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(Colors.redAccent)),
            onPressed: () {
              catController.addUserCategory(categoryController.text);
              categoryController.clear();
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Category added success full")));
              fetchdata();
            },
            child: const Text("Add"))
      ],
    );
  }
}