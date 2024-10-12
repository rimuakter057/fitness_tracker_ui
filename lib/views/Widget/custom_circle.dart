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
    required this.size,
     this.icon,
    this.iconSize,
    this.height,
    this.width,
    this.color,
    this.iconColor,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? size.height * .08,
      width: width ?? size.width * .08,
      decoration: BoxDecoration(
          color: color ?? AppColors.whiteColor.withOpacity(.3),
          shape: BoxShape.circle),
      child: Center(
        child: Icon(
          icon,
          size: iconSize ?? size.height * .03,
          color:iconColor?? AppColors.whiteColor,
        ),
      ),
    );
  }
}
