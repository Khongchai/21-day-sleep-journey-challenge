import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/widgets/daily_instructions/utils/dialog_decor.dart';

Future<void> showAlertDialog(
  BuildContext context,
) {
  const double dialogHeight = 200;
  return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          backgroundColor: const Color(0xff232274),
          child: Stack(
            children: [
              ...buildDialogDecor(dialogHeight),
              Container(
                height: dialogHeight,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      """Before you sleep, follow the 2nd step previously mentioned. Then, see you tomorrow night !""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      child: const Text("Got it!",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(appColors.accent),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          )));
}
