import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:yawwn/pages/ending_pages/surprise.dart';
import 'package:yawwn/widgets/common/custom_elevated_button.dart';
import 'package:yawwn/widgets/daily_instructions/utils/show_custom_column_dialog.dart';

import '../text_with_shadow.dart';

Future showGiftBoxDialog(BuildContext context) {
  return showCustomColumnDialog(
      context,
      [
        Align(alignment: Alignment.center, child: _buildTopDialogSection()),
        const SizedBox(height: 10),
        const Text("YOU JUST A COMPLETED 21-DAY SLEEP JOURNEY CHALLENGE",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const StrokedTextWithShadow(
          text: "We have a surprise gift for you",
          color: Color(0xffECC230),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
            text: "CLAIM FREE GIFT",
            onPressed: () => Navigator.pushNamed(context, Surprise.screenName),
            color: const Color(0xffFF839f)),
        const SizedBox(height: 20),
      ],
      bgColor: const Color(0xff6150FF));
}

Widget _buildTopDialogSection() {
  return (Stack(
    children: [
      Positioned(
        child: Opacity(
          opacity: 0.4,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff4b3ec1))),
          ),
        ),
        right: 0,
        left: 0,
        top: 0,
        bottom: 0,
      ),
      SvgPicture.asset("assets/decor/congratulations-box.svg"),
    ],
  ));
}
