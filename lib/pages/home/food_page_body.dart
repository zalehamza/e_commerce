import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_column.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/icon_and_text_widget.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  double rating = 3.5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print('Current page value =' + _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("Current height is = "+ Get.context!.height.toString());
    print("Current width is = "+ Get.context!.width.toString());
    return Column(
      children: [
        GetBuilder <PopularProductController> (builder: (popularProducts){
        return popularProducts.isLoaded ? Container(
          height: Dimensions.pageView,
          // color: Colors.red,
          child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position, popularProducts.popularProductList[position] );
                //   return Container();
              }),
        ) :
          CircularProgressIndicator(
          color: AppColors.mainColor,
        );
        }),
        //Slider Section of the products


        //Indication the scrolling pageview (dots)
        GetBuilder<PopularProductController>(builder: (popularProduct){
          return new DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty? 1 : popularProduct.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.mainColor,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),

          );

        }),

        //Popular text
        SizedBox(height: Dimensions.height15,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            children: [
              BigText(text: 'Populaire'),
              SizedBox(width: Dimensions.width10,),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                  child: BigText(text: '.', color: Colors.black26,)
              ),
              SizedBox(width: Dimensions.width10,),
              SmallText(text: 'Food pairing'),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height15,),
        // Container(
        //   color: Colors.black26,
        //   height: 100,
        // ),

        //List food and image
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width10,bottom: Dimensions.width10),
                child: Row(
                  children: [
                    Container(
                      height: Dimensions.listViewImgSize,
                      width: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: Colors.blue,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/3.jpg"),
                        )
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20)
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: 'Nutrition fruit in meal'),
                              SizedBox(height:Dimensions.height5),
                              SmallText(text: 'with these burkina characteristics'),
                              SizedBox(height:Dimensions.height5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle,
                                      text: 'cercle',
                                      iconColor: AppColors.iconColor1),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: '1.7 km',
                                      iconColor: AppColors.mainColor),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                  IconAndTextWidget(
                                      icon: Icons.access_time,
                                      text: '32 min',
                                      iconColor: AppColors.iconColor2),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        ),

      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProductList) {

    //Matrix for the transition between the differents products
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentScale, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor), 1);
    }


    return Transform(
      transform: matrix,

      //Stack Product image et informations
      child: Stack(
        children: [

          //Container for Product image
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    // image: AssetImage('assets/image/1.jpg'))),
                    image: NetworkImage(
                        AppConstants.BASE_URL + "/uploads/" + popularProductList.img!
                    )
                )
            ),

          ),

          //Container for Product informations
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20, bottom: Dimensions.height15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),

              child: Container(
                padding: EdgeInsets.only(top: Dimensions.width10, left: Dimensions.width10, right: Dimensions.width10),
                child: AppColumn(text: popularProductList.name!, rating: popularProductList.stars!,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
