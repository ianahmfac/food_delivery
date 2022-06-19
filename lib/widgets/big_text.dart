import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/configs/colors.dart';
import '../app/configs/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double? size;
  final TextOverflow overflow;
  const BigText(
    this.text, {
    Key? key,
    this.color = AppColors.mainBlackColor,
    this.size,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size ?? Dimensions.textSize20,
      ),
      maxLines: 1,
      overflow: overflow,
    );
  }
}
