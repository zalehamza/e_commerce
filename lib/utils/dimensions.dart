import 'package:get/get.dart';


class Dimensions{
  //The principle is simple, we take the height or width for dynamic view
  //Example : Height = 725, font of container = 100
  //So we take quotient = Height/font of container
  // dynamicHeight = Height/quotient

  //Size of screen
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //Size of widget pageBuilder
  static double pageView = screenHeight/2.9;
  static double pageViewContainer = screenHeight/3.625;
  static double pageViewTextContainer = screenHeight/8.06;

  //Dynamic height for padding and margin
  static double height5 = screenHeight/145;
  static double height10 = screenHeight/72.5;
  static double height15 = screenHeight/48.33;
  static double height20 = screenHeight/36.25;
  static double height30 = screenHeight/24.17;
  static double height45 = screenHeight/16.11;

  //Dynamic Width for padding and margin
  static double width5 = screenHeight/145;
  static double width10 = screenHeight/72.5;
  static double width15 = screenHeight/48.33;
  static double width20 = screenHeight/36.25;
  static double width30 = screenHeight/24.17;
  static double width45 = screenHeight/16.11;

  //Dynamic fontSize
  static double font20 = screenHeight/36.25;
  static double font12 = screenHeight/60.42;
  static double font26 = screenHeight/27.89;

  //Dynamic radius
  static double radius15 = screenHeight/48.33;
  static double radius20 = screenHeight/36.25;
  static double radius30 = screenHeight/24.17;

  //Dynamic icon size (default size = 24)
  static double iconSize24 = screenHeight/30.21;
  static double iconSize20 = screenHeight/36.25;
  static double iconSize16 = screenHeight/45.31;

  //ListView size 360
  static double listViewImgSize = screenWidth/3;
  static double listViewTextContSize = screenWidth/3.6;

  //Popular food
  static double popularFoodImgSize = screenHeight/2.59;

  //bottomNavigationBar
  static double bottomHeightBar = screenHeight/7.25;

  //customSingleScrollView
  static double toolbarHeight = screenHeight/9.0625;
  static double expandedHeight = screenHeight/3.625;


}