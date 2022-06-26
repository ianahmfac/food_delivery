import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final double? iconSize;
  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: iconSize?.h ?? 24.h,
        ),
        SizedBox(width: 4.w),
        Flexible(
          child: FittedBox(
            child: SmallText(text),
          ),
        ),
      ],
    );
  }
}
