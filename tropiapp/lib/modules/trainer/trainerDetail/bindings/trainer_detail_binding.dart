import 'package:get/get.dart';

import '../controllers/trainer_detail_controller.dart';

class TrainerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainerDetailController>(
      () => TrainerDetailController(),
    );
  }
}
