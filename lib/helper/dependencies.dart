import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/data/repository/popular_product_repo.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(()=>PopularProductRepo(apiclient: Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiclient: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find()));


}