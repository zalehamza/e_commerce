import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/popular_product_controller.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool  hiddenText = true;
  double textHeight = Dimensions.screenHeight/3.625;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length > textHeight){
      // print('taille du texte' + widget.text.length.toString());
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);

    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    if(widget.text.length > textHeight){
      // print('taille du texte' + widget.text.length.toString());
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);

    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text:  hiddenText? ("$firstHalf...") : (firstHalf+secondHalf)),
          // SmallText(text:  widget.text),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
                print("Valeur de hiddenText "+ hiddenText.toString() );
                print("Valeur de firstText "+ secondHalf );
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more", color: AppColors.mainColor,),
                Icon( hiddenText? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
