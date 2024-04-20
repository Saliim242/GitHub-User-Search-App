import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';

class CustomReposAndFallowers extends StatelessWidget {
  const CustomReposAndFallowers({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: GoogleFonts.metrophobic(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "$data",
          style: GoogleFonts.metrophobic(
            fontSize: 18,
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
