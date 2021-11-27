import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';

class StyledStackContainer extends StatelessWidget {
  final List<Widget> children;
  final bool withGradient;

  const StyledStackContainer(
      {Key? key, required this.children, this.withGradient = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1 / 0,
        decoration: BoxDecoration(
          color: appColors.background,
          gradient: withGradient
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                      appColors.background,
                      const Color(0xff060727),
                    ])
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Stack(children: children),
        ));
  }
}
