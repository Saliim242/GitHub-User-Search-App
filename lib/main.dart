import 'package:GitHub_user_search_app/app/modules/home/bindings/home_binding.dart';
import 'package:GitHub_user_search_app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub User Search ',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
