import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/configs/colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double height;
  const SmallText(
    this.text, {
    Key? key,
    this.color = AppColors.textColor,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
        height: height,
      ),
    );
  }
}
