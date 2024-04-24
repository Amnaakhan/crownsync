import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledesign/Model/collection_model.dart';
import 'package:mobiledesign/Model/emailmessages_model.dart';
import 'package:mobiledesign/Model/getsentmails_model.dart';
import 'package:mobiledesign/Model/login_model.dart';
import 'package:mobiledesign/Model/rolex_model.dart';
import 'package:mobiledesign/Model/user_model.dart';
import 'package:mobiledesign/Model/user_profile.dart';

class ApiController extends GetxController {
  CollectionModel? collectionModel;
  RolexxModel? rolexxModel;
  InboxModel? emailMessagesModel;
  GetSentMailsModel? getSentMailsModel;
  RxList<Userlist> user = RxList();
  LoginModel? loginModel;


  // Userlist? userlist;

  ProfileModel? profileModel;

  // var userList = <Userlist>[].obs; // List to store user models
  // var selectedUser = Rxn<Userlist>(); // Rxn<User> for an optional user

  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    get_collection();
    get_rolexmodel();
    postlogin();
    getEmailMsgs();
    get_sentemails();
    get_profile();
    super.onInit();
  }

  get_collection() async {
    isLoading(true);
    // log(isLoading.toString());
    http.Response response =
    await http.get(Uri.tryParse('https://api.crownsync.ai/api/collects')!);
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
    http.Response response = await http.get(
        Uri.tryParse('https://api.crownsync.ai/api/rolex_models')!,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZGFiNmY1YTRkMTM5ZTY5YWZmYjJjN2Z"
              "lNjQ4NjUyZmVjYzIzNzk4YWVjN2U5YTM5OWNlNzhlNWYwZTRkOTViOG"
              "RhNmQ5ODU4OGExZjM0OGYiLCJpYXQiOjE3MTM3ODYwMzEuODcxMDQsIm"
              "5iZiI6MTcxMzc4NjAzMS44NzEwNDIsImV4cCI6MTc0NTMyMjAzMS44NzA"
              "xODEsInN1YiI6IjE5Iiwic2NvcGVzIjpbXX0.MmKAS-eNgm12sKqzfS_T9"
              "80dGBEJpXVxT7xOuJ0zcrxiq7ri0geSjWMTYecUvfFxWShPbDoHNE_jy4O"
              "DFvEwTkG-byCZdWflKEc72HC1zfeuTZUblWKfP4R1nNh6qbQTdUdyvzpue0I"
              "1MTTztpsKcLpbe96VYvaOQM3nn8_G4qYQ7td0P7oNSpbwrwE85x6g1wuRTj8u"
              "8acZ4OZhrYvxEf0nZgZiYqBPwFkQiTe8bFOfJV9CR3zLHUupVG_Ba0OCi9fcgL"
              "ZGRGs7Y_WaDIu-CLaTUIaJ3JW3ivnJyZDMo2xm_icxx-xWtE5xb-8M_urP7gOJm"
              "Xp6lUBFmFcRKxwLfVuwkGSWktjss_PVB7TNBryuxNsEAtWVtQmM50eOLCUw5VOdyy"
              "LIAqujuxIsLhQ604-bQQH-OpeO6SgDdcJ8amNt3fyveD-weWWUMw5yeG9yL27k7Eez9"
              "YAmFdCeeYZDe1hmE5RJ3DIZWt75q2Kml9AkqhVi2BIYhf9PD_FHZ7K0Fq9apjnWh0iRxc"
              "VYlA8Hbn4aE4OxB8AL08hjON7nDl0pTfrDIqiRQH0ex3shkle0a-whKFv1RR__B4Urp9scn"
              "RcTTxbMexwC20dIgHTaDnXb-hWoqdOiAMBPU3rj7i84ko7QTbVYhgduixC4MjfZe5Lmwr9h6nSLpM3_uwoI82Y",

        }
        );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      rolexxModel = RolexxModel.fromJson(result);
      // log(result.toString());
      print('Rolex Model = ${result}');
      isLoading(false);
    }
  }

  // void fetchUsers() async {
  //   try {
  //     isLoading(true);
  //     var response = await Get.find<http.Client>().get(Uri.parse('https://api.crownsync.ai/api/userlist'));
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       userList.value = userlistFromJson(json.encode(jsonResponse));
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  get_sentemails() async {
    isLoading(true);
    // log(isLoading.toString());
    http.Response response = await http.get(
        Uri.tryParse('https://api.crownsync.ai/api/getsentmails')!,
        headers: {
          "Accept": "application/json",
          "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZjBiYjViY2FjOTM5MzEzNjI2"
              "MDlmYmYzZGYwYzA4ZGE5ZDFjNTRjMDgyNzY3ZTAzOWIyZjdkNzlhMDgzYjU4"
              "OTEzMjYxMjg5NWJjOTI4ZjgiLCJpYXQiOjE3MTM5MzU0MjIuMDgyNzgsIm5"
              "iZiI6MTcxMzkzNTQyMi4wODI3ODIsImV4cCI6MTc0NTQ3MTQyMi4wODIwMjQsInN1"
              "YiI6IjI1Iiwic2NvcGVzIjpbXX0.L0ypgsJFChQDmFq9Vr6w3DgxyXEGiSedTQHPok"
              "yp8aMgTj7uKMOce3aMvJ0bRsRFUHR0m284VVVjUpqL15JYdVw6YuNA13_RfmvtihDRs9La"
              "xM9g-ZIz_avrxd-QGJ000zisk63vG_NegXBRgVp8jsp2DiG_D3YdNAs4e1wQKGlYoQyYNifS"
              "21w4hY2g7_qhZi_wJa28RdpKdWqgYefJ-vHEMgicnRuNTfXWkWwzWM-rr_cZLwhib7tQRXA9o"
              "TBLSRq8tkqP1u0vxy5s1w6CqBtVdiyJ-fGMTCBOXCpB2oMFUOJipxMVDu6vSmFiBWGJQ6XLZ3KX"
              "Zxs_2qXTjCj3pYC2vEf8MSFKmOMze4ZP11md2HpEzBmeAqbtVxTmbBPN8nXovzdXcz_Ma35d-P49q"
              "vZZ-By0kVa3utmSTqcsLG7iYZfJe7OKJ7nSUI3R5kjQ0fMZ_hfLJOtqcb-1NauNlh-qvuNeiPfQw40m"
              "3BChSsmlXzoMTHpPuWIr2M-Mp4omUdnGJ0SOvzL9UxCWmnBTRv0jOIW5FcewScqsYbkiWXzplTws_43pY"
              "26U4MbdqteQ5t7UwONCbQA_8WKwzeWzu4LEdjMj1pS3vFy3HzY8EreFSTV6VMa7oj7Go57lccmKGSNFx74"
              "CV0CKSFCZ5RJPG0bdpMB4XQLZXTQrE30XLwA" }
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      getSentMailsModel = GetSentMailsModel.fromJson(result);
      // log(result.toString());
      print('Send Emails = ${result}');
      isLoading(false);
    }
  }

  postlogin() async {
    isLoading(true);
    // log(isLoading.toString());
    http.Response response = await http.post(
      Uri.tryParse('https://api.crownsync.ai/api/login')!,
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      loginModel = LoginModel.fromJson(result);
      // log(result.toString());
      print('Logins = ${result}');
      isLoading(false);
    }
  }

  get_profile() async {
    isLoading(true);
    // log(isLoading.toString());
    http.Response response = await http
        .get(Uri.tryParse('https://api.crownsync.ai/api/profile')!, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
          ".eyJhdWQiOiIzIiwianRpIjoiZGFiNmY1YTRkMTM5ZTY5YWZmYjJjN2Z"
          "lNjQ4NjUyZmVjYzIzNzk4YWVjN2U5YTM5OWNlNzhlNWYwZTRkOTViOG"
          "RhNmQ5ODU4OGExZjM0OGYiLCJpYXQiOjE3MTM3ODYwMzEuODcxMDQsIm"
          "5iZiI6MTcxMzc4NjAzMS44NzEwNDIsImV4cCI6MTc0NTMyMjAzMS44NzA"
          "xODEsInN1YiI6IjE5Iiwic2NvcGVzIjpbXX0.MmKAS-eNgm12sKqzfS_T9"
          "80dGBEJpXVxT7xOuJ0zcrxiq7ri0geSjWMTYecUvfFxWShPbDoHNE_jy4O"
          "DFvEwTkG-byCZdWflKEc72HC1zfeuTZUblWKfP4R1nNh6qbQTdUdyvzpue0I"
          "1MTTztpsKcLpbe96VYvaOQM3nn8_G4qYQ7td0P7oNSpbwrwE85x6g1wuRTj8u"
          "8acZ4OZhrYvxEf0nZgZiYqBPwFkQiTe8bFOfJV9CR3zLHUupVG_Ba0OCi9fcgL"
          "ZGRGs7Y_WaDIu-CLaTUIaJ3JW3ivnJyZDMo2xm_icxx-xWtE5xb-8M_urP7gOJm"
          "Xp6lUBFmFcRKxwLfVuwkGSWktjss_PVB7TNBryuxNsEAtWVtQmM50eOLCUw5VOdyy"
          "LIAqujuxIsLhQ604-bQQH-OpeO6SgDdcJ8amNt3fyveD-weWWUMw5yeG9yL27k7Eez9"
          "YAmFdCeeYZDe1hmE5RJ3DIZWt75q2Kml9AkqhVi2BIYhf9PD_FHZ7K0Fq9apjnWh0iRxc"
          "VYlA8Hbn4aE4OxB8AL08hjON7nDl0pTfrDIqiRQH0ex3shkle0a-whKFv1RR__B4Urp9scn"
          "RcTTxbMexwC20dIgHTaDnXb-hWoqdOiAMBPU3rj7i84ko7QTbVYhgduixC4MjfZe5Lmwr9h6nSLpM3_uwoI82Y",

    },);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      profileModel = ProfileModel.fromJson(result);
      // log(result.toString());
      print('profile = ${result}');
      isLoading(false);
    }
  }

  // get_userlist() async {
  //   isLoading(true);
  //   // log(isLoading.toString());
  //   http.Response response = await http
  //       .get(Uri.tryParse('https://api.crownsync.ai/api/userlist')!,headers: {
  //     "Accept": "application/json",
  //     "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
  //         ".eyJhdWQiOiIzIiwianRpIjoiMTc4YzBhMmY1OGM3NjAzZjRiYzNlNWM0"
  //         "OGZlOTQ0MTA0YzhjYWM0ZjdiYzEwNDE2ZmZjOThmODRmODhhOGM4ZTQzN"
  //         "TY2N2NkNTIxZTk1OWQiLCJpYXQiOjE3MTM1MTExMDQuMzE2ODg2LCJuYm"
  //         "YiOjE3MTM1MTExMDQuMzE2ODg4LCJleHAiOjE3NDUwNDcxMDQuMzE2MDg5"
  //         "LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.WHO0lm8_TNbVq3pJX89Vhd6jk6"
  //         "Q6LlqjMy1G3kseNJBAb9yt7lzuvrPEUjQHXn16pcMux063dlyfOKkQEGay6"
  //         "ZX4v0sh2wCJmGRUPFDlaIRGy_IwCNrcw7DNrwI98CgsP_fsUvaZA8Msh_lc"
  //         "WidKLuliy6-nEFYp5QVmkiS1gm8mPWJd0UTSKKefRczqsB2rMEbBa6TVgEE"
  //         "Ken5BwRXnXscYZ8XwHzoSXFRNO27fWarNwYUPAORBT-sxrOG95V714_yJn22"
  //         "TAa9AHTASNraLPyvPsXFg-YPrG5pvhxXqQCrIy5ioinYd71yle4_Xc8uyJGhEK"
  //         "dVROttVYphohgGRRotAJ0yL_rz3hM6wY77_Y0eHRPgpczA5wtJuPjsDNrQmF4p"
  //         "t5rE7UpesnYF1tDxVkgbja4mDIICkG5muWW-7rUmQ6Z7gZ5zlBQh-so8N8_26bZ"
  //         "H8vt0ut5qTMHm80QEoQ0BwCU5qARtJgLnaySx2ri8k-bMwjGhskFrVUomCRFNOP"
  //         "YIpkgFpkoNoM7wlleVUfFg9Vttx_GuFMA5zi9dWOo0iUkxv32vR6YrXHdr6YFP"
  //         "4BC5oD5LZZQg4m8R-XUBMIY-W7_7CS8OFAdP8AuslAC_RQ8fF-nfQWtY1b-FhVK"
  //         "6cR1soaFXW-m7h3-rjgXhT5oghviNzY7kPkWa72Cg0Eqs",
  //   });
  //   if (response.statusCode == 200) {
  //
  //     var result = jsonDecode(response.body);
  //     userlist = Userlist.fromJson(result);
  //     // log(result.toString());
  //     print('Response = ${result}');
  //     isLoading(false);
  //   }
  // }


  // Future<void> get_userlist() async {
  //   isLoading.value = true;
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse('https://api.crownsync.ai/api/userlist'),
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
  //             ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0ND"
  //             "IxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNz"
  //             "QwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5"
  //             "iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyM"
  //             "jMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmo"
  //             "g2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVz"
  //             "B5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2De"
  //             "BDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfh"
  //             "jX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTE"
  //             "q70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy02"
  //             "4HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dC"
  //             "POdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISw"
  //             "pAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHs"
  //             "bwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YG"
  //             "eE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9"
  //             "i4NHVNzlFLeCw",
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       var result = jsonDecode(response.body);
  //       List users = result['data'];
  //
  //       // Clear the existing list and populate with new users
  //       userList.clear();
  //       for (var userJson in users) {
  //         // userList.add(Userlist.fromJson(userJson));
  //       }
  //       isLoading.value = false; // Set loading to false after data is fetched
  //     } else {
  //       // Print the actual error message
  //       print("Error fetching user list: ${response.statusCode}, ${response.body}");
  //       isLoading.value = false; // Also set loading to false in case of error
  //     }
  //   } catch (e) {
  //     print('Error fetching userlist : $e');
  //     isLoading.value = false; // Set loading to false on exception
  //   }
  // }
  Future<void> getEmailMsgs() async {
    isLoading(true);

    http.Response response = await http.get(
      Uri.tryParse('https://api.crownsync.ai/api/email-messages')!,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
            ".eyJhdWQiOiIzIiwianRpIjoiY2UwYzIyMmI1NjZiMWRlYzM2ZWJjOGU3Y"
            "zBmMDE3NzI2NmM4ZmFkMTZiMTk3MWFiMzU0MDJmMDRmZmMwNTliNjQ0YzNk"
            "ZDE1NmYyYWE5ZjkiLCJpYXQiOjE3MTM3ODMwMjIuMzg4MTI5LCJuYmYiOjE3"
            "MTM3ODMwMjIuMzg4MTMxLCJleHAiOjE3NDUzMTkwMjIuMzg3MTk3LCJzdWIiOi"
            "IxOSIsInNjb3BlcyI6W119.IfaT156xsXoW1XYj64vNkt5PmdWuCV1IWyGHimKAE"
            "7fEaYQFCYbMZBC_wBeYJYDYzMwcAVtbqKp1gyBmibromFLtJNWkqQtYrLVkWajOzs1C"
            "0YhHAAdibCX0Zt9IBg6oImbfmqQNXkPSWSzXh6y2JQx3R-3NwFdbxaCfIxd_conJKcuuW"
            "EoU504-sHkLfHdqKlJJwJ_ZkWpJSo68qPhtBkZ_1OCqXL6BVhnnCmNNKfmZpw5oKVXp26iw"
            "RHnwlDGjgXdMrvIrGCLcw2XbI3SCczgpoWeRLdBOu7RQwPhbA69_3UMb0ILSGgHX1zRMrpeJK"
            "8RiZzdeEMUh825LaBGpPk_ooRtwl11vi2b10kFDueNR-lBb2Wj3JSBi5wKAghgCvfhsklgqbTl"
            "QtDJwv71sCO0m5fMCPtXjetYKan5D4G_4LuVKdbnllFb_uyrTVKo-AYgUK4mYeXbmgROpbJgCZPS"
            "ynz5I5We3j3CIRv-h_V-xApewvMe2xrgxKtDq445MkBLuZuVPsBoXx6_oLX2Gx_2HuDYBDXITrbBNn7"
            "RNGTQUjNFnF60YDVRwxkz-aohfRJhrrSprn85YdkmXgUuNQAHhlhUyYhMHXXCV1TxDXLmd5Iwo1seeTEU"
            "nt_wDHCurONDkudWPFwykOx1m2zvbrCvJi6ixNN1pwKF2od9SIRc",
      },
    );

    if (response.statusCode == 200) {
      print('Email Msgs: ${response.body}');

      // Parse response body only if it is valid JSON

        var result = jsonDecode(response.body);
        emailMessagesModel = InboxModel.fromJson(result);
        print('Email Msgs == ${result}');

    } else {
      print('Failed to load email messages: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }

    isLoading(false);
  }
}
