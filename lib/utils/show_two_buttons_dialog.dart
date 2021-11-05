import "package:flutter/material.dart";

showTwoButtonsDialog(BuildContext context, VoidCallback onCancelPressed,
    VoidCallback onContinuePressed) {
  Widget cancelButton = TextButton(
    onPressed: onCancelPressed,
    child: const Text("No"),
  );

  Widget continueButton =
      TextButton(onPressed: onContinuePressed, child: const Text("Yes"));

  AlertDialog alert = AlertDialog(
      title: const Text("Are you sure? This will log you out."),
      actions: [cancelButton, continueButton]);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
