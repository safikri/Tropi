import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tropiapp/themes/constants.dart';
import 'package:tropiapp/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Username"),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white),
                ),
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      // onTap: () {
                      //   Route TrainerList = MaterialPageRoute(
                      //     builder: (context) => const TrainerListScreen(),
                      //   );
                      //   Navigator.push(context, TrainerList);
                      // },
                      onTap: () => Get.toNamed(
                        Routes.TRAINERLIST,
                        arguments: {
                          // "patient": controller.patientsSearch[index],
                          "patient": 'cara lempar parameter',
                        },
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(
                                'assets/icons/coach.png',
                                width: 50,
                                height: 50,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Search Coach",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      // onTap: () {
                      //   Route CourtDetail = MaterialPageRoute(
                      //     builder: (context) => PlaygroundListScreen(),
                      //   );
                      //   Navigator.push(context, CourtDetail);
                      // },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(
                                'assets/icons/court.png',
                                width: 50,
                                height: 50,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Search Court",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
