import 'package:flutter/material.dart';

import 'color.dart';

class CustomText extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Size? size;

  const CustomText({
    super.key,
    this.size,
    this.fontSize,
    this.fontWeight,
    this.color,
    required this.text,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final defaultSize = size ?? MediaQuery.sizeOf(context);
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? defaultSize.height * .03,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textDark,
        height: 1.2,
      ),
    );
  }
}