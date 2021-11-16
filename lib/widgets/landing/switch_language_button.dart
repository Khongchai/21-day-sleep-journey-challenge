import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';

class SwitchLanguageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String languageTag;
  final String selectedLocale;

  const SwitchLanguageButton(
      {required this.selectedLocale,
      required this.languageTag,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(languageTag,
          style: TextStyle(
              color: selectedLocale == languageTag
                  ? appColors.accent
                  : appColors.primary)),
    );
  }
}
