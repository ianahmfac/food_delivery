import 'package:flutter/material.dart';

import '../../../app/configs/dimensions.dart';
import '../../../widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: Dimensions.iconSize24,
        ),
        SizedBox(width: Dimensions.width4),
        Expanded(child: SmallText(text)),
      ],
    );
  }
}
