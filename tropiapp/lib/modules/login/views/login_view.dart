import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/login_controller.dart';
import '../../../controllers/auth_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset('assets/icons/logo2.svg'),
              ),
              const SizedBox(
                height: 10,
              ),
              buttonItem(
                "assets/images/google.svg",
                "Continue with Google",
                20,
                () => authC.login(),
              ),
              const SizedBox(
                height: 15,
              ),
              buttonItem(
                  "assets/images/phone1.svg", "Sign up with email", 20, () {}),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Or",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // textItem("Email", _emailController, false),
              // const SizedBox(
              //   height: 15,
              // ),
              // textItem("Password", _passwordController, true),
              // const SizedBox(
              //   height: 15,
              // ),
              // colorButton("Sign Up"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      " Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonItem(
      String imagePath, String buttonName, double size, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 60,
        child: Card(
          elevation: 8,
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: size,
                width: size,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
