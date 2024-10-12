import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/text_style.dart';
import '../../Widget/custom_circle.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomListTile({
    super.key,
    required this.size,required this.title,required this.subTitle,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomCircle(
        height:  size.height * .05,
        width:  size.width * .05,
        size: size,
        color: AppColors.limeColor,
      ),
      title: CustomText(
        size: size,
        text:title,
        fontSize: size.height*.025,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      subtitle: CustomText(
        size: size,
        text:subTitle,
        fontWeight: FontWeight.w400,
        fontSize: size.height*.02,
        color: AppColors.secondaryColor,
      ),
    );
  }
}