import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:tropiapp/models/playground_model.dart';
import 'package:tropiapp/models/trainer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../routes/app_pages.dart';

class PlaygroundListController extends GetxController {
  final authController = Get.find<AuthController>();

  // var trainers = List<Trainer>[].obs;
  // List<Trainer> trainers = [];

  Future<List<Playground>> fetchPlaygroundData() async {
    var _dataCourt = <Playground>[];

    var url = Uri.parse(
        'http://' + authController.urlApi + '/getPlaygroundsByCoach?id=1');
    try {
      var jsonResponse = await http.get(url);
      if (jsonResponse.statusCode == 200) {
        Iterable it = jsonDecode(jsonResponse.body);

        _dataCourt = it.map((e) => Playground.fromJson(e)).toList();

        return await _dataCourt;
      }
    } catch (e) {}

    return await _dataCourt;
  }
}
