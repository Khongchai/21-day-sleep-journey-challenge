import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> buildDialogDecor(double dialogHeight) {
  final leftAsset = SvgPicture.asset("assets/decor/star-column-I.svg");
  final rightAsset = SvgPicture.asset("assets/decor/star-column-II.svg");

  return [
    Positioned(top: 20, left: 10, child: leftAsset),
    Positioned(top: 20, right: 10, child: rightAsset),
  ];
}
