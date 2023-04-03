import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tropiapp/themes/constants.dart';
import 'package:tropiapp/models/trainer_model.dart';
import 'package:tropiapp/routes/app_pages.dart';

import '../controllers/trainer_list_controller.dart';

class TrainerListView extends GetView<TrainerListController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Coach",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Trainer>>(
                future: controller.fetchTrainerData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    List<Trainer> trainers = snapshot.data;
                    return Expanded(
                      child: trainers.isNotEmpty
                          ? ListView.builder(
                              itemCount: trainers.length,
                              itemBuilder: (context, index) => Card(
                                key: ValueKey(trainers[index].coachId),
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  // onTap: () {
                                  //   Route TrainerDetail = MaterialPageRoute(
                                  //     builder: (context) => TrainerDetailScreen(
                                  //       trainer: trainers[index],
                                  //     ),
                                  //   );
                                  //   Navigator.push(context, TrainerDetail);
                                  // },

                                  onTap: () => Get.toNamed(
                                    Routes.TRAINERDETAIL,
                                    arguments: {
                                      // "patient": controller.patientsSearch[index],
                                      "trainer": trainers[index],
                                    },
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Container(
                                                color: Colors.blue,
                                                width: 120,
                                                height: 120,
                                                child: Image.asset(
                                                  "assets/images/Coach1.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: primaryColor,
                                                ),
                                                Text(
                                                  trainers[index]
                                                      .rating
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: primaryColor),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "(15 Ratings)",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                trainers[index].nameDisplay,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                trainers[index].info +
                                                    " | " +
                                                    trainers[index].info2,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'Rp. ${authController.priceFormat.format(trainers[index].price)}/Hour',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 2),
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text('Follow'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: primaryColor,
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Center(
                              child: Text(
                                "No results found",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
