import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: Dimensions.toolbarHeight,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.clear,),
                    AppIcon(icon: Icons.shopping_cart_outlined)
                  ],
                ),
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(

                    width: double.maxFinite,
                    child: Center(child: BigText(text: 'Sliver app bar',)),
                    padding: EdgeInsets.only(top: Dimensions.height5, bottom:  Dimensions.height10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)
                      )
                    ),
                  ),
                ),
                backgroundColor: AppColors.yellowColor,
                expandedHeight: Dimensions.expandedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                      'assets/image/3.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),

                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
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
                      padding: EdgeInsets.all(Dimensions.height10),
                    )
                  ],
                ),

              )
            ],

          ),
          // bottomNavigationBar: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(
          //         left: Dimensions.width20*2.5,
          //         right: Dimensions.width20*2.5,
          //         top: Dimensions.height10,
          //         bottom: Dimensions.height10
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           AppIcon(icon: Icons.remove),
          //           BigText(text: "\$12.89 X 0", color: AppColors.mainColor,size: Dimensions.font26,),
          //
          //           AppIcon(icon: Icons.add)
          //         ],
          //       ),
          //     ),
          //     Container(
          //       height: Dimensions.bottomHeightBar,
          //       padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15,left: Dimensions.width15, right: Dimensions.width15),
          //       decoration: BoxDecoration(
          //         color: AppColors.buttonBackgroundColor,
          //         //   color:AppColors.textColor,
          //           borderRadius: BorderRadius.only(
          //               topRight: Radius.circular(Dimensions.radius15),
          //               topLeft: Radius.circular(Dimensions.radius15)
          //           )
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Container(
          //             padding: EdgeInsets.all(Dimensions.width10),
          //             decoration: BoxDecoration(
          //                 borderRadius:  BorderRadius.circular(Dimensions.radius15),
          //                 color: Colors.white
          //             ),
          //             child: Icon(
          //               Icons.favorite,
          //               color: AppColors.mainColor,
          //             )
          //           ),
          //           Container(
          //             child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
          //             padding: EdgeInsets.all(Dimensions.width10),
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
          //                 color: AppColors.mainColor
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        )
    );
  }
}
