import 'package:flutter/material.dart';
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/widgets/daily_instructions/utils/shwo_alert_dialog.dart';

class CheckButton extends StatelessWidget {
  final bool enabled;
  const CheckButton({required this.enabled, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: enabled ? buildEnabledButton(context) : buildDisabledButton(),
    );
  }

  Widget buildEnabledButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: MaterialStateProperty.all<Color>(appColors.accent),
      ),
      onPressed: enabled ? () => showAlertDialog(context) : null,
      child: buildButtonContent(const Color(0xff000000)),
    );
  }

  Widget buildDisabledButton() {
    return Opacity(
      opacity: 0.7,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1.0, color: Color(0xffffffff)),
        ),
        onPressed: null,
        child: buildButtonContent(const Color(0xffffffff)),
      ),
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
