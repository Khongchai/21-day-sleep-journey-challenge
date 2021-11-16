import "package:flutter/material.dart";

Future<void> showAlertDialog(
  BuildContext context,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
          title: Text("test title"), content: Text("test content")));
}
