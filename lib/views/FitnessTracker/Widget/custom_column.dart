import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/text_style.dart';

class CustomColumn extends StatelessWidget {
  final Color? textColor;
  final String text;
  final bool? isField;
  const CustomColumn({
    super.key,
    required this.size, required this.text, this.textColor, this.isField,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: size.height * .01,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:isField==true ?AppColors.backgroundColor: AppColors.blackOpacityColor.withOpacity(.2),
        ),
      ),
      CustomText(size: size, text:text,color: textColor?? AppColors.blackOpacityColor.withOpacity(.2),
        fontSize: size.height *.025,
      )
    ],);
  }
}