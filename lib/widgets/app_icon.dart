import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  Color backgroundColor;
  Color iconColor;
  double size;
  AppIcon({Key? key,
    this.backgroundColor = const Color(0xffcdcbca),
    this.iconColor = const Color(0xff151412),
    this.size = 40,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),

      child: Icon(
        icon,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
