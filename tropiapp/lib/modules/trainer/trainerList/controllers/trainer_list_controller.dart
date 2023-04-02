import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:tropiapp/models/trainer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../../routes/app_pages.dart';

class TrainerListController extends GetxController {
  final authController = Get.find<AuthController>();

  // var trainers = List<Trainer>[].obs;
  // List<Trainer> trainers = [];

  Future<List<Trainer>> fetchTrainerData() async {
    print("fetchTrainerData.");

    var trainers = <Trainer>[];

    var url = Uri.parse(
        'http://' + authController.urlApi + '/getCoachBySport?id=1&userId=3');

    print(url);

    try {
      var jsonResponse = await http.get(url);

      if (jsonResponse.statusCode == 200) {
        Iterable it = jsonDecode(jsonResponse.body);
        trainers = it.map((e) => Trainer.fromJson(e)).toList();

        return await trainers;
      }
    } catch (e) {}

    return await trainers;
  }
}
