import "package:flutter/material.dart";

class LoadingPageOverlay extends StatelessWidget {
  static const screenName = "/loading_page_overlay";
  const LoadingPageOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    return const Scaffold(
      backgroundColor: Color.fromARGB(200, 0, 0, 0),
      body: Align(
        child: CircularProgressIndicator(),
        alignment: Alignment.center,
      ),
    );
  }
}
