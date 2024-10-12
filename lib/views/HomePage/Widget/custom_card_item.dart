import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/text_style.dart';
import '../../Widget/custom_circle.dart';

class CustomCardItem extends StatelessWidget {
  final String? data;
  final String? distance;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? distanceColor;
  const CustomCardItem({
    super.key,
    required this.size, this.data, this.icon, this.distance, this.backgroundColor, this.fontColor, this.distanceColor,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:backgroundColor?? AppColors.secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: CustomCircle(
              size: size,
              icon:icon?? Icons.directions_run,
              color: AppColors.limeColor,
              height: size.height * .15,
              width: size.width * .15,
            ),
          ),
          CustomText(
            size: size,
            text: data.toString(),
            color:fontColor?? Colors.white70,
            fontWeight: FontWeight.w300,
          ),
          CustomText(
            size: size,
            text:distance?? "73 km",
            color:distanceColor?? AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}