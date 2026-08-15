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
      height: height ?? 38,
      width: width ?? 38,
      decoration: BoxDecoration(
        color: color ?? AppColors.cardSurfaceLight,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize ?? 18,
          color: iconColor ?? AppColors.textDark,
        ),
      ),
    );
  }
}
