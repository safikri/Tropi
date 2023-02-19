import 'package:get/get.dart';

import 'package:tropiapp/modules/home/bindings/home_binding.dart';
import 'package:tropiapp/modules/home/views/home_view.dart';
import 'package:tropiapp/modules/login/bindings/login_binding.dart';
import 'package:tropiapp/modules/login/views/login_view.dart';
import 'package:tropiapp/modules/introduction/bindings/introduction_binding.dart';
import 'package:tropiapp/modules/introduction/views/introduction_view.dart';

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
  ];
}
