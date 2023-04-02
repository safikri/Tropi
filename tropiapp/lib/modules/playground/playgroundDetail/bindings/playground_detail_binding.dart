import 'package:get/get.dart';

import '../controllers/playground_detail_controller.dart';

class PlaygroundDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaygroundDetailController>(
      () => PlaygroundDetailController(),
    );
  }
}
