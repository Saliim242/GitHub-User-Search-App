import 'dart:convert';
import 'dart:developer';
import 'package:doctor_appointment_app/app/modules/home/models/github_user_profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/constant.dart';

class HomeProvider extends GetConnect {
  getGitHubUserData(String user) async {
    //String token
    log("SAAALIMOW kAAALAY");
    var response = await http.get(Uri.parse("${APIKEY}$user"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      log("User Data From API ${data}", name: "auth/me");

      return UserProfileModel.fromJson(data);
    } else {
      var data = jsonDecode(response.body);
      throw data["message"];
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
