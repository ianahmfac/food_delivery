import 'package:flutter/material.dart';

import '../../../app/configs/colors.dart';
import '../../../app/configs/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';

class MainFoodHeader extends StatelessWidget {
  const MainFoodHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
        vertical: Dimensions.height15,
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
                        size: Dimensions.iconSize24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: Dimensions.height45,
                width: Dimensions.width45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColors.mainColor,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: Dimensions.iconSize24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
