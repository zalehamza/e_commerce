import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              //Showing the header
              Container(
                margin: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: 'Burkina Faso', color: AppColors.mainColor,),
                        Row(
                          children: [
                            SmallText(text:"Bobo-Dioulasso", color: Colors.black,),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        height: Dimensions.height45,
                        width: Dimensions.height45,
                        child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Showing the body
              Expanded(
                  child: SingleChildScrollView(child: FoodPageBody())
              ),
            ],
          ),
        )
    );
  }
}
