import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/configs/colors.dart';
import '../../../app/utils/app_image.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';
import 'icon_and_text_widget.dart';

class FoodBanner extends StatefulWidget {
  const FoodBanner({Key? key}) : super(key: key);

  @override
  State<FoodBanner> createState() => _FoodBannerState();
}

class _FoodBannerState extends State<FoodBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220.h;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBannerFood(),
        DotsIndicator(
          dotsCount: AppImage.homeBannerFoodList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(9.h),
            activeSize: Size(18.h, 9.h),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            spacing: REdgeInsets.all(6),
          ),
        ),
      ],
    );
  }

  Widget _buildBannerFood() {
    return SizedBox(
      height: 320.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: AppImage.homeBannerFoodList.length,
        itemBuilder: (context, index) {
          final image = AppImage.homeBannerFoodList[index];
          var matrix = Matrix4.identity();
          // For currently item showed
          if (index == _currentPageValue.floor()) {
            var currScale =
                1 - (_currentPageValue - index) * (1 - _scaleFactor);
            var currentTrans = _height * (1 - currScale) / 2;
            matrix = Matrix4.diagonal3Values(1, currScale, 1)
              ..setTranslationRaw(0, currentTrans, 0);
          }
          // For next item
          else if (index == _currentPageValue.floor() + 1) {
            var currScale = _scaleFactor +
                (_currentPageValue - index + 1) * (1 - _scaleFactor);
            var currentTrans = _height * (1 - currScale) / 2;
            matrix = Matrix4.diagonal3Values(1, currScale, 1)
              ..setTranslationRaw(0, currentTrans, 0);
          }
          // For previous item
          else if (index == _currentPageValue.floor() - 1) {
            var currScale =
                1 - (_currentPageValue - index) * (1 - _scaleFactor);
            var currentTrans = _height * (1 - currScale) / 2;
            matrix = Matrix4.diagonal3Values(1, currScale, 1)
              ..setTranslationRaw(0, currentTrans, 0);
          }
          // Set to default scaling
          else {
            matrix = Matrix4.diagonal3Values(1, _scaleFactor, 1)
              ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
          }
          return Transform(
            transform: matrix,
            child: Stack(
              children: [
                _buildImage(image),
                _buildInformation(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(String image) {
    return Container(
      height: 220.h,
      margin: REdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.mainColor,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInformation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120.h,
        margin: REdgeInsets.only(right: 30, left: 30, bottom: 30),
        padding: REdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: (5.0),
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BigText('Chinese Side'),
            SizedBox(height: 10.h),
            Row(
              children: [
                Flexible(
                  child: Wrap(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 14.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                const Flexible(child: SmallText('4.5')),
                SizedBox(width: 10.w),
                const SmallText('1287 comments'),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: const [
                Expanded(
                  child: IconAndTextWidget(
                    icon: Icons.circle_sharp,
                    color: AppColors.iconColor1,
                    text: 'Normal',
                  ),
                ),
                Expanded(
                  child: IconAndTextWidget(
                    icon: Icons.location_on,
                    color: AppColors.mainColor,
                    text: '1.7km',
                  ),
                ),
                Expanded(
                  child: IconAndTextWidget(
                    icon: Icons.access_time,
                    color: AppColors.iconColor2,
                    text: '32min',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
