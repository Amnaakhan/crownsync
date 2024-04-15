import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobiledesign/Model/collection_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledesign/Model/rolex_model.dart';


class ApiController extends GetxController {
  CollectionModel? collectionModel;
  RolexModel? rolexModel;
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    get_collection();
    get_rolexmodel();
    super.onInit();}


  get_collection() async {
    isLoading(true);
    // log(isLoading.toString());
    http.Response response = await http
        .get(Uri.tryParse('https://crawonapi.martinmobiles.com/api/collects')!);
    if (response.statusCode == 200) {

      var result = jsonDecode(response.body);
      collectionModel = CollectionModel.fromJson(result);
      // log(result.toString());
      print('Response = ${result}');
      isLoading(false);
    }
  }


  get_rolexmodel() async {
    isLoading(true);
    // log(isLoading.toString());
    http.Response response = await http
        .get(Uri.tryParse('https://crawonapi.martinmobiles.com/api/rolex_models')!);
    if (response.statusCode == 200) {

      var result = jsonDecode(response.body);
      rolexModel = RolexModel.fromJson(result);
      // log(result.toString());
      print('Response = ${result}');
      isLoading(false);
    }
  }

}