import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tropiapp/themes/constants.dart';
import 'package:tropiapp/models/playground_model.dart';
import 'package:tropiapp/widgets/select_schedule_screen.dart';

import '../controllers/playground_detail_controller.dart';

class PlaygroundDetailView extends GetView<PlaygroundDetailController> {
  final authController = Get.find<AuthController>();
  double rating = 4;

  final Playground playground = Get.arguments["playground"];

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
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/11/27/18/59/tennis-5782695_960_720.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      playground.name,
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
                      playground.rating.toString(),
                      style: const TextStyle(fontSize: 18, color: primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tennis Court',
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
                  'Address',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  playground.address,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/map-address.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          height: 50,
          width: 325,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _showModalBottomSheet(context),
                child: Text(
                  "Select Schedules",
                ),
              ),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.4,
              maxChildSize: 0.9,
              minChildSize: 0.32,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: SelectSchedule(),
              ),
            ));
  }
}
