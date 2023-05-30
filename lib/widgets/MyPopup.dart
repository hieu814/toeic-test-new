import 'package:flutter/material.dart';

Future<String> _showPopup(BuildContext context) async {
  TextEditingController _textEditingController = TextEditingController();
  String enteredText = '';

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter Text'),
        content: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(hintText: 'Type something...'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              enteredText = _textEditingController.text;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

  return enteredText;
}
