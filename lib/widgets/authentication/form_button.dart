import "package:flutter/material.dart";

class FormButton extends StatelessWidget {
  final VoidCallback action;
  final String buttonText;

  const FormButton(this.buttonText, this.action, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: Text(buttonText, style: const TextStyle(fontSize: 18)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 11, horizontal: 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xff084fff),
        ),
      ),
    );
  }
}
