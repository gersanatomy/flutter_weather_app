import 'package:flutter/material.dart';

mixin ErrorDialogMixin {
  showError(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("Got It"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Oops!"),
      content: const Text("Please check your internet connection"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
