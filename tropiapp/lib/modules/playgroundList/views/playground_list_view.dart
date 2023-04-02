import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tropiapp/themes/constants.dart';
import 'package:tropiapp/models/playground_model.dart';

import '../controllers/playground_list_controller.dart';

class PlaygroundListView extends GetView<PlaygroundListController> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Playgrounds",
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
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          FutureBuilder<List<Playground>>(
              future: controller.fetchPlaygroundData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Playground> _dataCourt = snapshot.data;
                  return Expanded(
                    child: _dataCourt.isNotEmpty
                        ? ListView.builder(
                            itemCount: _dataCourt.length,
                            itemBuilder: (context, index) => Card(
                              key: ValueKey(_dataCourt[index].playgroundId),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                // onTap: () {
                                //   Route PlaygroundDetail = MaterialPageRoute(
                                //     builder: (context) =>
                                //         PlaygroundDetailScreen(
                                //       id: _dataCourt[index].playgroundId,
                                //       name: _dataCourt[index].name,
                                //     ),
                                //   );
                                //   Navigator.push(context, PlaygroundDetail);
                                // },
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
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _dataCourt[index].name,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.pin_drop,
                                                  color: Colors.lightBlue,
                                                ),
                                                Text(
                                                  'Bintaro Permai',
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                                                              FontWeight.bold),
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
                                                const SizedBox(height: 10),
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
                                                              FontWeight.bold),
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
                          )
                        : Center(
                            child: const Text(
                              "No results found",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                  );
                }
              })
        ]),
      ),
    );
  }
}
