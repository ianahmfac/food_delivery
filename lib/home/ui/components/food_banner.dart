import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../app/configs/colors.dart';
import '../../../app/configs/dimensions.dart';
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
  final double _height = Dimensions.pageViewContainer;

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
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBannerFood() {
    return SizedBox(
      height: Dimensions.pageView,
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
      height: Dimensions.pageViewContainer,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30),
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
        height: Dimensions.pageViewTextContainer,
        margin: EdgeInsets.only(
          right: Dimensions.width30,
          left: Dimensions.width30,
          bottom: Dimensions.height30,
        ),
        padding: EdgeInsets.all(Dimensions.height15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 5.0,
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
            SizedBox(height: Dimensions.height10),
            Row(
              children: [
                Flexible(
                  child: Wrap(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Flexible(child: SmallText('4.5')),
                const SizedBox(width: 10),
                const SmallText('1287 comments'),
              ],
            ),
            SizedBox(height: Dimensions.height15),
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
