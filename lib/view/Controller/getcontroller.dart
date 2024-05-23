import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledesign/Model/check_login.dart';
import 'package:mobiledesign/Model/collection_model.dart';
import 'package:mobiledesign/Model/emailmessages_model.dart';
import 'package:mobiledesign/Model/getsentmails_model.dart';
import 'package:mobiledesign/Model/location_model.dart';
import 'package:mobiledesign/Model/query_model.dart';
import 'package:mobiledesign/Model/rolex_model.dart';
import 'package:mobiledesign/Model/store_model.dart';
import 'package:mobiledesign/Model/user_model.dart';
import 'package:mobiledesign/Model/user_profile.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';

class ApiController extends GetxController {
  Checklogin? loginModel;
  Modeldata? rolexxModel;
  InboxModel? emailMessagesModel;
  GetSentMailsModel? getSentMailsModel;
  Querydata?  querydata;
  Locationdata? locationdata;
  RxList<Userlist> user = RxList();
  Storedata? storedata;
  Collectiondata? collectiondata;
  ProfileModel? profileModel;



  var isLoading = true.obs;
  var isloader = true.obs;
  AuthController authController = Get.put(AuthController());

  @override
  Future<void> onInit() async {
    get_checklogin();
    get_sentemails();
    get_profile();
    get_querydata();
    get_location();
    get_store();
    get_collection();
    get_model();
    super.onInit();
  }

  get_checklogin() async {
    isLoading(true);
    // log(isLoading.toString());
    String? token = await AuthController().getToken();
    print('usertoken $token');

    http.Response response =
    await http.get(Uri.tryParse('https://api.crownsync.ai/api/check-login')!,  headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",

    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      loginModel = Checklogin.fromJson(result);
      // log(result.toString());
      print('checkLogin = ${result}');
      isLoading(false);
    }
  }
  get_querydata() async {
    isloader(true);
    String? token = await AuthController().getToken();
    print('usertoken $token');
    isloader(true);

    http.Response response =
    await http.get(Uri.tryParse('https://testapi.crownsync.ai/api/admin/scop_settings')!,  headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",

    });
    isloader(true);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      querydata = Querydata.fromJson(result);
      // log(result.toString());
      print('querydata = ${result}');
      isloader(false);    }
  }
  get_location() async {
    isloader(true);
    String? token = await AuthController().getToken();
    print('usertoken $token');
    isloader(true);

    http.Response response =
    await http.get(Uri.tryParse('https://testapi.crownsync.ai/api/fetch-locations')!,  headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",

    });
    isloader(true);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      locationdata = Locationdata.fromJson(result);
      // log(result.toString());
      print('locationdata = ${result}');
      isloader(false);    }
  }

  get_collection() async {
    isloader(true);
    String? token = await AuthController().getToken();
    print('usertoken $token');
    isloader(true);

    http.Response response =
    await http.get(Uri.tryParse('https://testapi.crownsync.ai/api/collects')!,
        headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",

    });
    isloader(true);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      collectiondata = Collectiondata.fromJson(result);
      // log(result.toString());
      print('locationdata = ${result}');
      isloader(false);    }
  }

  get_store() async {
    isloader(true);
    String? token = await AuthController().getToken();
    print('usertoken $token');
    isloader(true);

    http.Response response =
    await http.get(Uri.tryParse('https://testapi.crownsync.ai/api/fetch-store')!,  headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",

    });
    isloader(true);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      storedata = Storedata.fromJson(result);
      // log(result.toString());
      print('Storedata = ${result}');
      isloader(false);
    }
  }




  get_sentemails() async {
    isLoading(true);
    // log(isLoading.toString());
    String? token = await AuthController().getToken();
    print('usertoken $token');
    http.Response response = await http.get(
        Uri.tryParse('https://testapi.crownsync.ai/api/getsentmails')!,
        headers: {
          "Accept": "application/json",
          "Authorization":
          "Bearer $token"
        }
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      getSentMailsModel = GetSentMailsModel.fromJson(result);
      // log(result.toString());
      print('Send Emails = ${result}');
      isLoading(false);
    }
  }



  get_profile() async {
    isloader(true);
    // log(isLoading.toString());
    String? token = await AuthController().getToken();

    print('usertoken $token');
    isloader(true);
    http.Response response = await http
        .get(Uri.tryParse('https://testapi.crownsync.ai/api/profile')!, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",

    },);
    isloader(true);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      profileModel = ProfileModel.fromJson(result);
      // log(result.toString());
      print('profile = ${result}');
      isloader(false);
    }
  }

  get_model() async {
    isLoading(true);
    // log(isLoading.toString());
    String? token = await AuthController().getToken();
    print('usertoken $token');
    http.Response response = await http.get(
        Uri.tryParse('https://testapi.crownsync.ai/api/rolex_models')!,
        headers: {
          "Accept": "application/json",
          "Authorization":
          "Bearer $token"
        }
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      rolexxModel = Modeldata.fromJson(result);
      // log(result.toString());
      print('rolex_model = ${result}');
      isLoading(false);
    }
  }
  // void removeItem(int id) {
  //   rolexxModel?.update((model) {
  //     model?.data?.removeWhere((item) => item.id == id);
  //   });
  // }

}
