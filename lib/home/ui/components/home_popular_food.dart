import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/configs/colors.dart';
import '../../../app/utils/app_image.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';
import 'icon_and_text_widget.dart';

class HomePopularFood extends StatelessWidget {
  const HomePopularFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          ListView.separated(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            padding: REdgeInsets.only(top: 20),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    height: 120.h,
                    width: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white38,
                      image: const DecorationImage(
                        image: AssetImage(AppImage.foodBanner1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      padding: REdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const BigText('Nutritious Fruit Meal in China'),
                          const SmallText('With chinese characteristics'),
                          Row(
                            children: const [
                              Expanded(
                                child: IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  color: AppColors.iconColor1,
                                  text: 'Normal',
                                  iconSize: 18,
                                ),
                              ),
                              Expanded(
                                child: IconAndTextWidget(
                                  icon: Icons.location_on,
                                  color: AppColors.mainColor,
                                  text: '1.7km',
                                  iconSize: 18,
                                ),
                              ),
                              Expanded(
                                child: IconAndTextWidget(
                                  icon: Icons.access_time,
                                  color: AppColors.iconColor2,
                                  text: '32min',
                                  iconSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const BigText('Popular'),
        SizedBox(width: 10.w),
        Container(
          margin: REdgeInsets.only(bottom: 3),
          child: const BigText('.', color: Colors.black26),
        ),
        SizedBox(width: 10.w),
        Container(
          margin: REdgeInsets.only(bottom: 2),
          child: const SmallText('Food pairing'),
        ),
      ],
    );
  }
}
