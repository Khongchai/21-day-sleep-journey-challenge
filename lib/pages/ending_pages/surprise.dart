import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/pages/ending_pages/sleep_mask_delivery.dart';
import 'package:yawwn/pages/last_page.dart';
import 'package:yawwn/widgets/common/custom_elevated_button.dart';
import 'package:yawwn/widgets/daily_instructions/utils/show_custom_column_dialog.dart';

class Surprise extends StatelessWidget {
  static const screenName = "/surprise";

  const Surprise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.violet,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Stack(
            children: [
              Positioned(
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                        "assets/decor/radial-gradient-background.png",
                        width: 200,
                        height: 200)),
              ),
              SizedBox(
                width: 1 / 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("SURPRISE GIFT!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Image.asset("assets/decor/surprise-gift.png"),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      child: Column(
                        children: const [
                          Text(
                            "We'll send you an aromatic sleep mask engraved with your name, free of charge!",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text("Click the button now to claim it!",
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                        text: "GET IT NOW",
                        onPressed: () => Navigator.pushNamed(
                                    context, SleepMaskDeliveryPage.screenName)
                                .then((_) {
                              showCustomColumnDialog(
                                  context,
                                  [
                                    const SizedBox(height: 30),
                                    const Text("ALL DONE!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    const SizedBox(height: 20),
                                    Column(children: const [
                                      Text(
                                        "We'll send a surprise sleep mask to the provided address.",
                                        textAlign: TextAlign.center,
                                      ),
                                      Text("Hang in there!")
                                    ]),
                                    SvgPicture.asset(
                                        "assets/decor/sleep-mask-clouds.svg"),
                                    Column(children: const [
                                      Text("You have finished your final day!"),
                                      Text("Have you noticed any change?"),
                                      Text("Please, tell us about it!")
                                    ]),
                                    const SizedBox(height: 10),
                                    const TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffffffff)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffffffff)),
                                        ),
                                      ),
                                      style:
                                          TextStyle(color: Color(0xffffffff)),
                                    ),
                                    const SizedBox(height: 30),
                                    CustomElevatedButton(
                                      text: "       Finish       ",
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed(LastPage.screenName);
                                      },
                                      color: const Color(0xffFF839f),
                                    ),
                                    const SizedBox(height: 30),
                                  ],
                                  bgColor: const Color(0xff6150FF),
                                  withExitButton: false);
                            }),
                        color: const Color(0xffFF839f))
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
