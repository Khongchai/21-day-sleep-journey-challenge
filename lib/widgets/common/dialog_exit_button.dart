import "package:flutter/material.dart";

class DialogExitButton extends StatelessWidget {
  const DialogExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close_outlined,
              color: Color(0xffffffff),
              size: 20,
            )),
      ],
    ));
  }
}
