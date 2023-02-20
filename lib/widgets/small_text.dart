import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double height;
  double size;
  SmallText({Key? key,
    required this.text,
    this.size = 0,
    this.height =1.2,
    this.color = const Color(0xFFFccc7c5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 5,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font12 :size,
        fontFamily: 'Roboto',
        height: height
      ),
    );
  }
}
