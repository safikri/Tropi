import 'package:get/get.dart';

import '../controllers/trainer_list_controller.dart';

class TrainerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerListController>(
      () => TrainerListController(),
    );
  }
}
