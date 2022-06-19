import 'package:flutter/material.dart';

import '../../app/configs/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'components/food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _homeAppBar(),
          const FoodPageBody(),
        ],
      ),
    );
  }

  Widget _homeAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText('Indonesia', color: AppColors.mainColor),
                  Row(
                    children: const [
                      SmallText('South Jakarta', color: Colors.black45),
                      Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainColor,
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}