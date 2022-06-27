import 'package:flutter/material.dart';

import 'components/food_banner.dart';
import 'components/home_popular_food.dart';
import 'components/main_food_header.dart';

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
          const MainFoodHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  FoodBanner(),
                  HomePopularFood(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
