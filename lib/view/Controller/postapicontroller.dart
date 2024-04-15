import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  Future<void> postData(String name, String slug) async {
    try {
      // Define the endpoint URL
      var url = Uri.parse('https://crawonapi.martinmobiles.com/api/collect-create');

      // Define the request body
      var body = {'name': name, 'slug': slug};

      // Make the POST request
      var response = await http.post(
        url,
        body: body,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}