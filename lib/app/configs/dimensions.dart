import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context?.height ?? 0;
  static double screenWidth = Get.context?.width ?? 0;

  static const _screenHeightDesign = 844.0;

  static double _proportionalSize(double size) =>
      screenHeight / (_screenHeightDesign / size);

  static double pageView = _proportionalSize(320);
  static double pageViewContainer = _proportionalSize(220);
  static double pageViewTextContainer = _proportionalSize(120);

  // dynamic height padding & margin
  static double height4 = _proportionalSize(4);
  static double height6 = _proportionalSize(6);
  static double height10 = _proportionalSize(10);
  static double height15 = _proportionalSize(15);
  static double height20 = _proportionalSize(20);
  static double height30 = _proportionalSize(30);
  static double height45 = _proportionalSize(45);

  // dynamic width padding & margin
  static double width4 = _proportionalSize(4);
  static double width6 = _proportionalSize(6);
  static double width10 = _proportionalSize(10);
  static double width15 = _proportionalSize(15);
  static double width20 = _proportionalSize(20);
  static double width30 = _proportionalSize(30);
  static double width45 = _proportionalSize(45);

  // dynamic radius
  static double radius15 = _proportionalSize(15);
  static double radius20 = _proportionalSize(20);
  static double radius30 = _proportionalSize(30);

  // dynamic text size
  static double textSize12 = _proportionalSize(12);
  static double textSize20 = _proportionalSize(20);

  // dynamic icon size
  static double iconSize24 = _proportionalSize(24);
  static double iconSize18 = _proportionalSize(18);
  static double iconSize14 = _proportionalSize(14);
  static double iconSize9 = _proportionalSize(9);
}
