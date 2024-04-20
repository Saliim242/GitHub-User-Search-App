import 'package:GitHub_user_search_app/app/modules/home/components/main_card_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "GitHub User Search",
          style: GoogleFonts.metrophobic(
            fontSize: 15,
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (valu) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .18),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.searchColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: valu.username,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                            // focusedBorder: OutlineInputBorder(),
                            hintText: "Search GitHub User",
                            hintStyle: GoogleFonts.metrophobic(
                              fontSize: 15,
                              color: Colors.blueGrey,
                            ),

                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        valu.getUser(valu.username.text.trim());
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColor.btnSearchColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.search,
                          size: 30,
                          color: AppColor.bgColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                GetBuilder<HomeController>(
                  builder: (home) {
                    if (home.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColor.textColor),
                        ),
                      );
                    } else if (home.user == null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Image.asset(
                            "assets/user-not-found.png",
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Your search did not match any users",
                            style: GoogleFonts.metrophobic(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor,
                            ),
                          ),
                        ],
                      );
                    }

                    return MainCardUserProfile(user: home.user!);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
