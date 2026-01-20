import 'package:flutter/material.dart';

import '../../utils/color.dart';

class CustomRow extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const CustomRow({
    super.key,
    required this.size, this.icon, this.text,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.blackOpacityColor,
          size: size.height * 0.03,
        ),
        const SizedBox(width: 5,),
        Text(text!,style: TextStyle(fontWeight: FontWeight.w400,
          fontSize: size.height*.02,
          color: AppColors.blackOpacityColor,
        ),)
      ],
    );
  }
}