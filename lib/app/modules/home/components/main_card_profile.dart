import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../utils/color.dart';
import '../models/github_user_profile_model.dart';
import 'custom_repo_and_followers.dart';

class MainCardUserProfile extends StatelessWidget {
  const MainCardUserProfile({
    super.key,
    required this.user,
  });

  final UserProfileModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.mainCardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "${user.avatarUrl}",
            ),
            radius: 35,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.name}",
                  style: GoogleFonts.metrophobic(
                    fontSize: 18,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "@${user.login}",
                      style: GoogleFonts.metrophobic(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Joined ${DateFormat('d MMM yyyy').format(DateTime.parse(user.createdAt!))}",
                      style: GoogleFonts.metrophobic(
                        fontSize: 13,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "${user.bio}",
                  style: GoogleFonts.metrophobic(
                    fontSize: 15,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.mainSubCardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomReposAndFallowers(
                        title: "Repos",
                        data: "${user.publicRepos}",
                      ),
                      CustomReposAndFallowers(
                        title: "Fallowings",
                        data: "${user.following}",
                      ),
                      CustomReposAndFallowers(
                        title: "Fallowers",
                        data: "${user.followers}",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                UserInfo(icon: IconlyBroken.work, title: user.company ?? ""),
                SizedBox(height: 8),
                UserInfo(
                    icon: IconlyBroken.location, title: user.location ?? ""),
                SizedBox(height: 8),
                UserInfo(
                    icon: IconlyBroken.time_circle,
                    title: DateFormat('hh:mm a').format(DateTime.now()) ?? ""),
                SizedBox(height: 8),
                UserInfo(
                    icon: IconlyBroken.time_circle,
                    title: DateFormat('hh:mm a').format(DateTime.now()) ?? ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blueGrey,
          // size: 22,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.metrophobic(
              fontSize: 15,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}
