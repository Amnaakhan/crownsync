import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledesign/Model/collection_model.dart';
import 'package:mobiledesign/Model/emailmessages_model.dart';
import 'package:mobiledesign/Model/getsentmails_model.dart';
import 'package:mobiledesign/Model/rolex_model.dart';
import 'package:mobiledesign/Model/user_model.dart';
import 'package:mobiledesign/Model/user_profile.dart';

class ApiController extends GetxController {
  CollectionModel? collectionModel;
  RolexModel? rolexModel;
  EmailMessagesModel? emailMessagesModel;
  GetSentMailsModel? getSentMailsModel;
  RxList<Userlist> user = RxList();

  // Userlist? userlist;
  var userList = <EmailMessagesModel>[].obs;

  ProfileModel? profileModel;
  // var userList = <Userlist>[].obs; // List to store user models
  // var selectedUser = Rxn<Userlist>(); // Rxn<User> for an optional user

  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    get_collection();
    get_rolexmodel();
    get_userlist();
    get_emailmsgs();
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
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0NDIxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNzQwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyMjMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmog2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVzB5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2DeBDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfhjX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTEq70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy024HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dCPOdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISwpAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHsbwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YGeE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9i4NHVNzlFLeCw",
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      rolexModel = RolexModel.fromJson(result);
      // log(result.toString());
      print('Response = ${result}');
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
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0NDIxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNzQwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyMjMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmog2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVzB5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2DeBDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfhjX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTEq70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy024HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dCPOdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISwpAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHsbwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YGeE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9i4NHVNzlFLeCw"
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      getSentMailsModel = GetSentMailsModel.fromJson(result);
      // log(result.toString());
      print('Emails = ${result}');
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
          ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0NDI"
          "xMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNzQwO"
          "WU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5iZiI6MTc"
          "xMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyMjMsInN1YiI6I"
          "jkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmog2OpW_xfSEXXKjk"
          "-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVzB5T1huKcjoOKTVeRjm"
          "XFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2DeBDqs02YWgsxB3PxcF51Ro"
          "QWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfhjX-ZrWxs7U77Ewf_qFF3JHdV"
          "MmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTEq70kOrCpEV2O2Q_Cu8IgS0cF9aR"
          "jF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy024HriBBoq3lXjnmb2TNr6oULn5khQmYBX8f"
          "j_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dCPOdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o"
          "-DyQBRhnpMm9ScQzTpIHISwpAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk"
          "0f7rKpICJkYTzrHsbwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0v"
          "q_Y9gnY1YGeE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9i4NHVNzlFLeCw",

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


  Future<void> get_userlist() async {
    isLoading.value = true;
    try {
      http.Response response = await http.get(
        Uri.parse('https://api.crownsync.ai/api/userlist'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0ND"
              "IxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNz"
              "QwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5"
              "iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyM"
              "jMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmo"
              "g2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVz"
              "B5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2De"
              "BDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfh"
              "jX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTE"
              "q70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy02"
              "4HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dC"
              "POdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISw"
              "pAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHs"
              "bwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YG"
              "eE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9"
              "i4NHVNzlFLeCw",
        },
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        List users = result['data'];

        // Clear the existing list and populate with new users
        userList.clear();
        for (var userJson in users) {
          // userList.add(Userlist.fromJson(userJson));
        }
        isLoading.value = false; // Set loading to false after data is fetched
      } else {
        // Print the actual error message
        print("Error fetching user list: ${response.statusCode}, ${response.body}");
        isLoading.value = false; // Also set loading to false in case of error
      }
    } catch (e) {
      print('Error fetching userlist : $e');
      isLoading.value = false; // Set loading to false on exception
    }
  }
  get_emailmsgs() async {
    isLoading(true);

    try {
      http.Response response = await http.get(
        Uri.tryParse('https://api.crownsync.ai/api/email-messages')!,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0ND"
              "IxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNz"
              "QwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5"
              "iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyM"
              "jMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmo"
              "g2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVz"
              "B5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2De"
              "BDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfh"
              "jX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTE"
              "q70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy02"
              "4HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dC"
              "POdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISw"
              "pAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHs"
              "bwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YG"
              "eE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9"
              "i4NHVNzlFLeCw",
        },
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        emailMessagesModel = EmailMessagesModel.fromJson(result);
        print('Email Msgs = ${result}');
      } else {
        print('Failed to load email messages: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching email messages: $e');
    }

    isLoading(false);
  }
}
