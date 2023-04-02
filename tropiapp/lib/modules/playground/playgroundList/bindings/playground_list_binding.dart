import 'package:get/get.dart';

import '../controllers/playground_list_controller.dart';

class PlaygroundListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaygroundListController>(
      () => PlaygroundListController(),
    );
  }
}
