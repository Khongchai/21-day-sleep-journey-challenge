import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';

class BottomNavigationButtons extends StatelessWidget {
  final String goForwardText;
  final VoidCallback forwardOnPressed;

  final String? goBackwardText;
  final VoidCallback? backwardOnPressed;

  const BottomNavigationButtons(
      {Key? key,
      required this.forwardOnPressed,
      required this.goForwardText,
      this.goBackwardText,
      this.backwardOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backwardFunctionalityDefined =
        goBackwardText != null && backwardOnPressed != null;
    final sharedBorderRadius =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (backwardFunctionalityDefined)
              Expanded(
                flex: 10,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 10),
                        shape: sharedBorderRadius,
                        side: const BorderSide(
                            width: 1.0, color: Color(0xaaffffff))),
                    onPressed: backwardOnPressed,
                    child: Text(goBackwardText as String,
                        style: const TextStyle(color: Color(0xffffffff)))),
              ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 10,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        sharedBorderRadius),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(appColors.primary),
                  ),
                  onPressed: forwardOnPressed,
                  child: Text(goForwardText,
                      style: const TextStyle(fontSize: 18))),
            ),
            if (!backwardFunctionalityDefined)
              const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
