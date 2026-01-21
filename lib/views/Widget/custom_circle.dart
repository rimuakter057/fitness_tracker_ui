import 'package:flutter/material.dart';
import '../../utils/color.dart';

class CustomCircle extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final double? height;
  final double? width;
  final Color? color;
  final Color? iconColor;

  const CustomCircle({
    super.key,

     this.icon,
    this.iconSize,
    this.height,
    this.width,
    this.color,
    this.iconColor,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 24,
      width:width?? 24,
      decoration: BoxDecoration(
          color: color ?? AppColors.whiteColor.withOpacity(.3),
          shape: BoxShape.circle),
      child: Center(
        child: Icon(
          icon,
          size: iconSize ?? 24,
          color:iconColor?? AppColors.whiteColor,
        ),
      ),
    );
  }
}
