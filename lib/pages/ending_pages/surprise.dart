import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';
import 'package:yawwn/pages/ending_pages/sleep_mask_delivery.dart';
import 'package:yawwn/widgets/common/custom_elevated_button.dart';

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
                    child: Image.asset(
                        "assets/decor/radial-gradient-background.png")),
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
                            context, SleepMaskDeliveryPage.screenName),
                        color: const Color(0xffFF839f))
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
