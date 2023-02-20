import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/pages/food/popular_food_detail.dart';
import 'package:e_commerce/pages/food/recommended_food_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

import 'pages/home/main_food_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      // home: PopularFoodDetail(),
      // home: RecommendedFoodDetails(),
    );
  }
}


