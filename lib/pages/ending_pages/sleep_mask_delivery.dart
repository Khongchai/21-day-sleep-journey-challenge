import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/widgets/sleep_mask_delivery/form.dart';

class SleepMaskDeliveryPage extends StatelessWidget {
  static const screenName = "/sleep_mask_delivery";

  const SleepMaskDeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.softPurple,
        appBar: AppBar(
          backgroundColor: appColors.softPurple,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            width: 1 / 0,
            padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(children: [
              buildTopText(),
              const SleepMaskForm(),
            ]),
          ),
        ));
  }

  Widget buildTopText() {
    return (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Fill in the information",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("we will send the sleep mask to you.")
        ]));
  }
}
