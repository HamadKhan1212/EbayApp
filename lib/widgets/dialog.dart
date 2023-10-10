import 'package:ebayapp/widgets/reusable_button.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  Future<void> appDialog(String error, context) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              ReusableButton(
                width: 100,
                nextScreen: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'Ok',
                color: Colors.red,
              )
            ],
          );
        });
  }
}
