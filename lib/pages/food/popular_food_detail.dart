import 'package:e_commerce/widgets/app_column.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  set rating(double rating) {}

  @override
  Widget build(BuildContext context) {
    double rating = 3.5;
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //Background image
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.popularFoodImgSize,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/4.jpg')
                        )
                    ),
                  )
              ),

              //Icon widget
              Positioned(
                  top: Dimensions.height15,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(icon: Icons.arrow_back_ios),
                      AppIcon(icon: Icons.shopping_cart),

                    ],
                  )
              ),
              //Introduction of food
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: Dimensions.popularFoodImgSize - 30,
                  child: Container(
                    padding: EdgeInsets.only(left: Dimensions.width10, right:Dimensions.width10, top: Dimensions.height10),
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius15),
                        topLeft: Radius.circular(Dimensions.radius15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(text: 'Pain Anglais', rating: 2,),
                        SizedBox(height: Dimensions.height10,),
                        BigText(text: 'Introduce'),
                        SizedBox(height: Dimensions.height10,),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                              text: "Je suis en plein formation. Je suis en plein formation.Je suis en plein formation"
                                  "Je suis en plein formation.Je suis en plein formation.Je suis en plein formation"
                                  "Je suis en plein formation. Je suis en plein formation. Je suis en plein formation"
                                  "Je suis en plein formation. Je suis en plein formation. Je suis en plein formation"
                                  "Je suis en plein formation. Je suis en plein formation. Je suis en plein formation"
                                  "Je suis en plein formation. Je suis en plein formation. Je suis en plein formation"
                              ,
                            ),
                          ),
                        )

                      ],
                    ),
                  )
              ),

              //Expandable Text

            ],
          ),
          bottomNavigationBar: Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15,left: Dimensions.width15, right: Dimensions.width15),
            decoration: BoxDecoration(
              // color: AppColors.buttonBackgroundColor,
              color: AppColors.textColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius15),
                topLeft: Radius.circular(Dimensions.radius15)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.width10),
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(Dimensions.radius15),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove, color: AppColors.signColor,),
                      SizedBox(width: Dimensions.width5,),
                      BigText(text: '0'),
                      SizedBox(width: Dimensions.width5,),
                      Icon(Icons.add, color: AppColors.signColor,)
                    ],
                  ),
                ),
                Container(
                  child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
                  padding: EdgeInsets.all(Dimensions.width10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
