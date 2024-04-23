// import 'package:flutter/material.dart';
// import 'package:mobiledesign/view/inbox_screen.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class ConnectAccountsPage extends StatefulWidget {
//   @override
//   _ConnectAccountsPageState createState() => _ConnectAccountsPageState();
// }
//
// class _ConnectAccountsPageState extends State<ConnectAccountsPage> {
//   final String initialUrl = "https://api.crownsync.ai/connect";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Connect Accounts'),
//       ),
//       body: WebView(
//         userAgent: "CrownSync/1.0 (Android)",
//         initialUrl: initialUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//         navigationDelegate: (NavigationRequest request) {
//           if (request.url.startsWith('https://api.crownsync.ai/return/final')) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => InboxScreen()),
//             );
//             // Prevent the WebView from navigating to the redirect URL
//             return NavigationDecision.prevent;
//           }
//           // Allow navigation to all other URLs
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';



class RolexWatchesPage extends StatefulWidget {
  @override
  _RolexWatchesPageState createState() => _RolexWatchesPageState();
}

class _RolexWatchesPageState extends State<RolexWatchesPage> {
  List<String> _watchNames = [];
  String? _selectedWatch;
  String? _selectedModel;
  List<Map<String, dynamic>> _rolexModels = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      List<String> watchNames = await fetchWatchNames();
      setState(() {
        _watchNames = watchNames;
      });
    } catch (error) {
      print('Error fetching watch names: $error');
    }
  }

  Future<List<String>> fetchWatchNames() async {
    final response = await http.get(Uri.parse('https://api.crownsync.ai/api/collects'), headers: {
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
    },);

    if (response.statusCode == 200) {
      List<String> watchNames = [];
      final List<dynamic> data = json.decode(response.body)['data'];

      for (var item in data) {
        watchNames.add(item['name']);
      }

      return watchNames;
    } else {
      throw Exception('Failed to load watch names');
    }
  }

  Future<List<Map<String, dynamic>>> fetchModelsForWatch(String watchName) async {
    final response = await http.get(Uri.parse('https://api.crownsync.ai/api/collects'), headers: {
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
    },);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<Map<String, dynamic>> models = [];

      for (var item in data) {
        if (item['name'] == watchName) {
          models = List<Map<String, dynamic>>.from(item['rolexModels']);
          break;
        }
      }

      return models;
    } else {
      throw Exception('Failed to load models for $watchName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rolex Watches'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Select a watch',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff808686),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: _watchNames.map((String watchName) {
                  return DropdownMenuItem<String>(
                    value: watchName,
                    child: Text(
                      watchName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff808686),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                value: _selectedWatch,
                onChanged: (String? value) async {
                  setState(() {
                    _selectedWatch = value;
                    _rolexModels = []; // Clear previous models
                  });
                  if (value != null) {
                    try {
                      List<Map<String, dynamic>> models = await fetchModelsForWatch(value);
                      setState(() {
                        _rolexModels = models;
                      });
                    } catch (error) {
                      print('Error fetching models: $error');
                    }
                  }
                },
                buttonStyleData: ButtonStyleData(
                  height: 5.h,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff808686),
                    ),
                    color: Color(0xffE0E1E1),
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Color(0xff808686),
                  iconDisabledColor: Color(0xff808686),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE0E1E1),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Select a model',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff808686),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: _rolexModels.map((Map<String, dynamic> model) {
                  return DropdownMenuItem<String>(
                    value: model['id'].toString(),
                    child: Text(
                      model['name'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff808686),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                value: _selectedModel,
                onChanged: (String? value) {
                  setState(() {
                    _selectedModel = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 5.h,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff808686),
                    ),
                    color: Color(0xffE0E1E1),
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Color(0xff808686),
                  iconDisabledColor: Color(0xff808686),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE0E1E1),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}