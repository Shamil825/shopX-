import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:rest_api_with_getx/model/model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  void onInit() {
    super.onInit();
    get();
  }

  var productList = <Model>[].obs;

  Future get() async {
    try {
      var uri = Uri.parse(
          "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
      var response = await http.get(uri);
      log("srep1");
      if (response.statusCode == 200) {
        log("srep2");
        log(response.body);
        var mub = modelFromJson(response.body);
        log("srep3");
        productList.value = mub;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
