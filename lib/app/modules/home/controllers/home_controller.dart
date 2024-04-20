import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:GitHub_user_search_app/app/modules/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import '../models/github_user_profile_model.dart';

class HomeController extends GetxController {
  final TextEditingController username = TextEditingController();
  bool isLoading = false;
  bool timeOut = false;
  bool socket = false;

  UserProfileModel? user; // Declare user without initialization

  getUser(String users) async {
    try {
      isLoading = true;
      timeOut = false;
      socket = false;
      update();
      user = await HomeProvider().getGitHubUserData(users);
      log("Response Data : ${user?.bio ?? ""}", name: "Response Data");
    } on TimeoutException {
      // Handle timeout exception
      isLoading = false;
      socket = false;
      timeOut = true;
      update();
      log("Timeout Exception", name: "Timeout Exception");
    } on SocketException {
      // Handle socket exception
      isLoading = false;
      socket = true;
      timeOut = false;
      update();
      log("Socket Exception", name: "Socket Exception");
    } catch (e) {
      // Handle other exceptions
      log("Error ${e.toString()}", name: "Provider error");
    } finally {
      isLoading = false;
      socket = false;
      timeOut = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    //getUser("Saliim242");
  }
}
