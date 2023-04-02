import 'package:get/get.dart';

import 'package:tropiapp/modules/home/bindings/home_binding.dart';
import 'package:tropiapp/modules/home/views/home_view.dart';
import 'package:tropiapp/modules/login/bindings/login_binding.dart';
import 'package:tropiapp/modules/login/views/login_view.dart';
import 'package:tropiapp/modules/introduction/bindings/introduction_binding.dart';
import 'package:tropiapp/modules/introduction/views/introduction_view.dart';
import 'package:tropiapp/modules/trainerList/bindings/trainer_list_binding.dart';
import 'package:tropiapp/modules/trainerList/views/trainer_list_view.dart';
import 'package:tropiapp/modules/playgroundList/bindings/playground_list_binding.dart';
import 'package:tropiapp/modules/playgroundList/views/playground_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.TRAINERLIST,
      page: () => TrainerListView(),
      binding: TrainerListBinding(),
    ),
    GetPage(
      name: _Paths.PLAYGROUNDLIST,
      page: () => PlaygroundListView(),
      binding: PlaygroundListBinding(),
    ),
  ];
}
