import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tropiapp/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Tropi app",
          body: "Find your match.",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Lottie.asset("assets/lottie/splash-panacea.json"),
          ),
        ),
        PageViewModel(
          title: "Tropi app",
          body: "Find your match.",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Lottie.asset("assets/lottie/splash-panacea.json"),
          ),
        ),
        PageViewModel(
          title: "Tropi app",
          body: "Find your match.",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Lottie.asset("assets/lottie/splash-panacea.json"),
          ),
        ),
      ],
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () => Get.offAllNamed(Routes.LOGIN),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    ));
  }
}
