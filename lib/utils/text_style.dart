import 'package:flutter/material.dart''';

import 'color.dart';

class CustomText extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String text;
  const CustomText({
    super.key,
    required this.size, this.fontSize, this.fontWeight, this.color, required this.text,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize:fontSize?? size.height*.03,
        fontWeight:fontWeight?? FontWeight.w600,color:color?? AppColors.whiteColor,
      height: 1.1,
    ),);
  }
}