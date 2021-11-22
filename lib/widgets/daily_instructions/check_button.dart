import 'package:flutter/material.dart';
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/widgets/daily_instructions/utils/shwo_alert_dialog.dart';

class CheckButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;
  final bool dayFinished;

  const CheckButton(
      {required this.dayFinished,
      required this.onPressed,
      required this.enabled,
      Key? key})
      : super(key: key);

  static const buttonPadding =
      EdgeInsets.symmetric(vertical: 1.5, horizontal: 12);

  @override
  Widget build(BuildContext context) {
    if (dayFinished) {
      return SizedBox(child: buildFinishedButton());
    }

    return SizedBox(
        child: enabled ? buildEnabledButton(context) : buildDisabledButton());
  }

  Widget buildEnabledButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(buttonPadding),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(appColors.accent),
      ),
      onPressed: enabled
          ? () {
              showAlertDialog(context);
              onPressed();
            }
          : null,
      child: buildButtonContent(const Color(0xff000000)),
    );
  }

  Widget buildDisabledButton() {
    return Opacity(
      opacity: 0.7,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: buttonPadding,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(width: 1.0, color: Color(0xffffffff)),
        ),
        onPressed: null,
        child: buildButtonContent(const Color(0xffffffff)),
      ),
    );
  }

  Widget buildFinishedButton() {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(buttonPadding),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff261D60)),
      ),
      onPressed: null,
      child: buildButtonContent(const Color(0xff181345)),
    );
  }

  Widget buildButtonContent(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Text("Check", style: TextStyle(fontSize: 18, color: color)),
        const SizedBox(width: 10),
        Icon(Icons.check_outlined, color: color),
      ]),
    );
  }
}
