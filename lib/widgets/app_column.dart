import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int rating;
  const AppColumn({Key? key, required this.text, required this.rating}) : super(key: key);

  // set rating(double rating) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: BigText(text: text, size: Dimensions.font20,)
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        Row(
          children: [
            RatingBar.builder(
              initialRating: rating.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: Dimensions.iconSize20,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rating = rating;
              },
            ),
            SizedBox(
              width: Dimensions.width15,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.width5,
            ),
            SmallText(text: '1279 comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
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
    );
  }
}
