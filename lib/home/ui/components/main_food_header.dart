import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/configs/colors.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';

class MainFoodHeader extends StatelessWidget {
  const MainFoodHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText('Indonesia', color: AppColors.mainColor),
                  Row(
                    children: [
                      const SmallText('South Jakarta', color: Colors.black45),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 24.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 45.h,
                width: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.mainColor,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
