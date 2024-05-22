import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/layout_screen.dart';
import '../../Helper/helper.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';


class ModelController extends GetxController {

  var isLoading = false.obs;


  model_data({
    required File? imageFile,
    required String name,
    required String slug,
    required String price,
    required String? stock,
    required String? collectionid,
    required String link,
    required String features,
    required String benefits,
  }) async {
    try {
      isLoading.value = true;
      var url = Helpers.base_api + 'store-models';
      String? token = await AuthController().getToken();

      String basicAuth = 'Bearer ' + token!;
      var stream = http.ByteStream(imageFile!.openRead().cast());
      var length = await imageFile.length();

      var uri = Uri.parse(url);

      var request = http.MultipartRequest("POST", uri);
      request.headers["Authorization"] = basicAuth;
      request.fields['name'] = name;
      request.fields['slug'] = slug;
      request.fields['price'] = price;
      request.fields['stock'] = stock!;
      request.fields['collection_id'] = collectionid!;
      request.fields['link'] = link;
      request.fields['benefits'] = benefits;
      request.fields['features'] = features;


      var multipartFile = http.MultipartFile('image', stream, length, filename: basename(imageFile.path));

      request.files.add(multipartFile);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      var responseData = json.decode(responseBody);

      // Capture response status code and body
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          Fluttertoast.showToast(
            msg: responseData['message'] ?? "Data Saved Successfully",
            backgroundColor: Colors.black,
          );


          Get.to(() => LayoutScreen());
        });
      } else {
        response.stream.transform(utf8.decoder).listen((value) {
          Fluttertoast.showToast(
            msg: responseData['message'] ,
            backgroundColor: Colors.red,

          );
          print(responseData['message']);

        });


      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }
}