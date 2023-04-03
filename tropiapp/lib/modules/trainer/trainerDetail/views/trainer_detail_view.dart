import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tropiapp/themes/constants.dart';
import 'package:tropiapp/models/trainer_model.dart';
import 'package:tropiapp/models/playground_model.dart';

import '../controllers/trainer_detail_controller.dart';

class TrainerDetailView extends GetView<TrainerDetailController> {
  final authController = Get.find<AuthController>();

  final Trainer trainer = Get.arguments["trainer"];
  double rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/CoachDetail.png",
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Rp. ${authController.priceFormat.format(trainer.price)}/Hour',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      trainer.nameDisplay,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    Text(
                      trainer.rating.toString(),
                      style: const TextStyle(fontSize: 18, color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainer.info + ' | ' + trainer.info2,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Coach',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  trainer.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          FutureBuilder<List<Playground>>(
            future: controller.fetchPlaygroundData(trainer.coachId.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<Playground> dataCourt = snapshot.data;
                return Row(
                  children: [
                    Expanded(
                      child: dataCourt.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Playgrounds',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    itemCount: dataCourt.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) => Card(
                                      key: ValueKey(
                                          dataCourt[index].playgroundId),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                                      "assets/images/CourtImage.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    dataCourt[index].name,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.pin_drop,
                                                        color: Colors.lightBlue,
                                                      ),
                                                      Text(
                                                        'Bintaro Permai',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: const [
                                                          Text(
                                                            'senin - jumat',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '08.00 am - 07.00 pm',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: const [
                                                          Text(
                                                            'senin - jumat',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '08.00 am - 07.00 pm',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Playgrounds',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Center(
                                    child: Text(
                                      'No data',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
