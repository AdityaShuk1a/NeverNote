import 'package:flutter/material.dart';



// Helper function to show AlertDialog
void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context, // Pass the context from the widget where this function is called
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
