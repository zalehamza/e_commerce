import 'package:e_commerce/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiclient;
  PopularProductRepo({required this.apiclient}){

}
  Future<Response> getPopularProductList() async {
    return await apiclient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}