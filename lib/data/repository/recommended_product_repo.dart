import 'package:e_commerce/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiclient;
  RecommendedProductRepo({required this.apiclient}){

  }
  Future<Response> getRecommendedProductList() async {
    return await apiclient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}