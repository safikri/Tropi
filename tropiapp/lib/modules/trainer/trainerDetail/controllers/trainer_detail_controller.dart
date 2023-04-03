import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tropiapp/controllers/auth_controller.dart';
import 'package:tropiapp/models/playground_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../../routes/app_pages.dart';

class TrainerDetailController extends GetxController {
  final authController = Get.find<AuthController>();

  Future<List<Playground>> fetchPlaygroundData(String coachId) async {
    var dataCourt = <Playground>[];

    var url = Uri.parse('http://' +
        authController.urlApi +
        '/getPlaygroundsByCoach?id=${coachId}');
    try {
      var jsonResponse = await http.get(url);
      if (jsonResponse.statusCode == 200) {
        Iterable it = jsonDecode(jsonResponse.body);
        dataCourt = it.map((e) => Playground.fromJson(e)).toList();
        return await dataCourt;
      }
    } catch (e) {}

    return await dataCourt;
  }
}
