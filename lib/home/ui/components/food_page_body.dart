import 'package:flutter/material.dart';

import '../../../app/configs/colors.dart';
import '../../../app/utils/app_image.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';
import 'icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: _pageController,
        itemCount: AppImage.homeBannerFoodList.length,
        itemBuilder: (context, index) {
          final image = AppImage.homeBannerFoodList[index];
          return Stack(
            children: [
              _buildImage(image),
              _buildInformation(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImage(String image) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
        height: 120,
        margin: const EdgeInsets.only(
          right: 30,
          left: 30,
          bottom: 30,
        ),
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
          left: 15,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BigText('Chinese Side'),
            const SizedBox(height: 10),
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
            const SizedBox(height: 16),
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
