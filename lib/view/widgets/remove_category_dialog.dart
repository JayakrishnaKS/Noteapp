import 'package:flutter/material.dart';

import '../../controller/maincontroller.dart';


class RemoveCategoryDialog extends StatelessWidget {
  RemoveCategoryDialog(
      {super.key,
        required this.categoryName,
        required this.categoryIndex,
        required this.fetchData});
  String categoryName;
  int categoryIndex;
  final void Function() fetchData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Dlete $categoryName ?"),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(Colors.green)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(Colors.redAccent)),
            onPressed: () {
              print(categoryIndex);
              print(categoryName);
              CategoryController().removeUserCategory(
                  catIndex: categoryIndex, fetchData: fetchData);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$categoryName deleted success full")));
              fetchData();
            },
            child: Text("Delete"))
      ],
    );
  }
}