import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText({Key? key,
    required this.text,
    this.size = 0,
    this.color = const Color(0xFFF332d2b),
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0? Dimensions.font20 :size ,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
